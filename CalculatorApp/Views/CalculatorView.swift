import UIKit

class CalculatorView: UIView {
    private lazy var printLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "12345"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
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
        NSLayoutConstraint.activate([
            printLabel.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: 30),
            printLabel.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: -30),
            printLabel.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: 200),
            printLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
