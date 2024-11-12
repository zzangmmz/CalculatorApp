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
    private lazy var sevenToNineStackView = makeHorizontalStackView([sevenButton, eightButton, nineButton, addButton])
    
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
    }
    
    func setConstraints() {
        printLabel.translatesAutoresizingMaskIntoConstraints = false
        sevenToNineStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            printLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            printLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            printLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            printLabel.heightAnchor.constraint(equalToConstant: 100),
            
            sevenToNineStackView.heightAnchor.constraint(equalToConstant: 80),
            sevenToNineStackView.topAnchor.constraint(equalTo: printLabel.bottomAnchor, constant: 60),
            sevenToNineStackView.widthAnchor.constraint(equalToConstant: 350),
            sevenToNineStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setSubviews() {
        [printLabel, sevenToNineStackView].forEach { addSubview($0) }
    }
    
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let stview = UIStackView()
        stview.axis = .horizontal
        stview.backgroundColor = .black
        stview.spacing = 10
        stview.distribution = .fillEqually
        views.forEach { stview.addArrangedSubview($0) }
        return stview
    }
}

extension UIColor {
    static let numberColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
}
