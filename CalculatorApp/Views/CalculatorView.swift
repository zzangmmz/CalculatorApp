import UIKit

final class CalculatorView: UIView {
    // MARK: - UI 컴포넌트 세팅
    private lazy var expressionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = currentExpression
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        return label
    }()
    
    private var currentExpression = "0" {
        didSet { expressionLabel.text = currentExpression }
    }
    
    private lazy var totalStackView: UIStackView = {
        createVerticalStackView([createHorizontalStackView(["7", "8", "9", "+"]),
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
        [expressionLabel, totalStackView].forEach { addSubview($0) }
        configureConstraints()
    }
    
    private func configureConstraints() {
        [expressionLabel, totalStackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            expressionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            expressionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            expressionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            expressionLabel.heightAnchor.constraint(equalToConstant: 100),
            
            totalStackView.widthAnchor.constraint(equalToConstant: 350),
            totalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            totalStackView.topAnchor.constraint(equalTo: expressionLabel.bottomAnchor, constant: 60)
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
            let button = createCalculatorButton(title: $0)
            stview.addArrangedSubview(button)
        }
        return stview
    }
    
    private func createVerticalStackView(_ stackViews: [UIStackView]) -> UIStackView {
        let stview = UIStackView()
        stview.axis = .vertical
        stview.backgroundColor = .black
        stview.spacing = 10
        stview.distribution = .fillEqually
        stackViews.forEach { stview.addArrangedSubview($0) }
        return stview
    }
    
    private func createCalculatorButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = Int(title) != nil ? .numberColor : .orange
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.tintColor = .white
        button.frame.size = CGSize(width: 80, height: 80)
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
        return button
    }
    
    @objc func buttonTouched(_ button: UIButton) {
        let title = button.currentTitle!
        if title == "AC" {
            expressionLabel.text! = "0"
        } else if title == "=" {
            expressionLabel.text! = String(calculate(expression: expressionLabel.text!)!)
        } else {
            if expressionLabel.text! == "0" {
                expressionLabel.text! = title
            } else {
                expressionLabel.text! += title
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
