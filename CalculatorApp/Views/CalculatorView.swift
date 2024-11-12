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
    
    private lazy var sevenButton = CalculatorButton(.numberColor, "7")
    private lazy var eightButton = CalculatorButton(.numberColor, "8")
    private lazy var nineButton = CalculatorButton(.numberColor, "9")
    private lazy var addButton = CalculatorButton(.orange, "+")
    private lazy var sevenToNineStackView = makeHorizontalStackView([sevenButton, eightButton, nineButton, addButton])
    
    private lazy var fourButton = CalculatorButton(.numberColor, "4")
    private lazy var fiveButton = CalculatorButton(.numberColor, "5")
    private lazy var sixButton = CalculatorButton(.numberColor, "6")
    private lazy var subtractButton = CalculatorButton(.orange, "-")
    private lazy var fourToSixStackView = makeHorizontalStackView([fourButton, fiveButton, sixButton, subtractButton])
    
    private lazy var threeButton = CalculatorButton(.numberColor, "3")
    private lazy var twoButton = CalculatorButton(.numberColor, "2")
    private lazy var oneButton = CalculatorButton(.numberColor, "1")
    private lazy var multipleButton = CalculatorButton(.orange, "*")
    private lazy var oneToThreeStackView = makeHorizontalStackView([threeButton, twoButton, oneButton, multipleButton])
    
    private lazy var acButton = CalculatorButton(.orange, "AC")
    private lazy var zeroButton = CalculatorButton(.numberColor, "0")
    private lazy var equalButton = CalculatorButton(.orange, "=")
    private lazy var divideButton = CalculatorButton(.orange, "/")
    private lazy var zeroStackView = makeHorizontalStackView([acButton, zeroButton, equalButton, divideButton])
    
    private lazy var totalStackView: UIStackView = {
        makeVerticalStackView([sevenToNineStackView, fourToSixStackView, oneToThreeStackView, zeroStackView])
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
            
            sevenToNineStackView.heightAnchor.constraint(equalToConstant: 80),
            fourToSixStackView.heightAnchor.constraint(equalToConstant: 80),
            oneToThreeStackView.heightAnchor.constraint(equalToConstant: 80),
            zeroStackView.heightAnchor.constraint(equalToConstant: 80),
            
            totalStackView.widthAnchor.constraint(equalToConstant: 350),
            totalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            totalStackView.topAnchor.constraint(equalTo: printLabel.bottomAnchor, constant: 60)
        ])
    }
    
    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stview = UIStackView()
        stview.axis = .horizontal
        stview.backgroundColor = .black
        stview.spacing = 10
        stview.distribution = .fillEqually
        views.forEach { stview.addArrangedSubview($0) }
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
