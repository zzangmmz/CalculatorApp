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
    
    private let sevenButton = CalculatorButton(.numberColor, "7")
    private let eightButton = CalculatorButton(.numberColor, "8")
    private let nineButton = CalculatorButton(.numberColor, "9")
    private let addButton = CalculatorButton(.numberColor, "+")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.backgroundColor = .black
        
        let sevenToNineStackView = HorizontalStackView([sevenButton, eightButton, nineButton, addButton])
        [sevenToNineStackView].forEach { addSubview($0) }
    }
    
    func setConstraints() {
        printLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            printLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            printLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            printLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            printLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setSubviews() {
        self.addSubview(printLabel)
    }
}

extension UIColor {
    static let numberColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
}
