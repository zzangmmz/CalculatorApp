import UIKit

final class CalculatorView: UIView {
    // MARK: - UI 컴포넌트 세팅
    private lazy var printLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "0"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        return label
    }()
    
    private lazy var totalStackView: UIStackView = {
        makeVerticalStackView([createHorizontalStackView(["7", "8", "9", "+"]),
                               createHorizontalStackView(["4", "5", "6", "-"]),
                               createHorizontalStackView(["3", "2", "1", "*"]),
                               createHorizontalStackView(["AC", "0", "=", "/"])])
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.backgroundColor = .black
        [printLabel, totalStackView].forEach { addSubview($0) }
        configureConstraints()
    }
    
    private func configureConstraints() {
        [printLabel, totalStackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            printLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            printLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            printLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            printLabel.heightAnchor.constraint(equalToConstant: 100),
            
            totalStackView.widthAnchor.constraint(equalToConstant: 350),
            totalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            totalStackView.topAnchor.constraint(equalTo: printLabel.bottomAnchor, constant: 60)
        ])
    }
    
    private func createHorizontalStackView(_ titles: [String]) -> UIStackView {
        let stview = UIStackView()
        stview.axis = .horizontal
        stview.backgroundColor = .black
        stview.spacing = 10
        stview.distribution = .fillEqually
        stview.heightAnchor.constraint(equalToConstant: 80).isActive = true
        titles.forEach {
            let button = CalculatorButton($0)
            button.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
            stview.addArrangedSubview(button)
        }
        return stview
    }
    
    private func makeVerticalStackView(_ stackViews: [UIStackView]) -> UIStackView {
        let stview = UIStackView()
        stview.axis = .vertical
        stview.backgroundColor = .black
        stview.spacing = 10
        stview.distribution = .fillEqually
        stackViews.forEach { stview.addArrangedSubview($0) }
        return stview
    }
    
    @objc func buttonTouched(_ button: CalculatorButton) {
        let title = button.currentTitle!
        if title == "AC" {
            printLabel.text! = "0"
        } else if title == "=" {
            printLabel.text! = String(calculate(expression: printLabel.text!)!)
        } else {
            if printLabel.text! == "0" {
                printLabel.text! = title
            } else {
                printLabel.text! += title
            }
        }
    }
    
    private func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}

extension UIColor {
    static let numberColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
}
