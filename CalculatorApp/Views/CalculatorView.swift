import UIKit

final class CalculatorView: UIView {
    // MARK: - UI 컴포넌트 세팅
    private lazy var printLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        return label
    }()
    
    private lazy var totalStackView: UIStackView = {
        makeVerticalStackView([makeHorizontalStackView(["7", "8", "9", "+"]),
                               makeHorizontalStackView(["4", "5", "6", "-"]),
                               makeHorizontalStackView(["3", "2", "1", "*"]),
                               makeHorizontalStackView(["AC", "0", "=", "/"])])
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .black
    }
    
    private func setSubviews() {
        [printLabel, totalStackView].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
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
    
    private func makeHorizontalStackView(_ labels: [String]) -> UIStackView {
        let stview = UIStackView()
        stview.axis = .horizontal
        stview.backgroundColor = .black
        stview.spacing = 10
        stview.distribution = .fillEqually
        stview.heightAnchor.constraint(equalToConstant: 80).isActive = true
        labels.forEach { stview.addArrangedSubview(CalculatorButton($0)) }
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
}

extension UIColor {
    static let numberColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
}
