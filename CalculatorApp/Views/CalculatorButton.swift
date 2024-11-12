import UIKit

final class CalculatorButton: UIButton {
    init(_ color: UIColor, _ text: String) {
        super.init(frame: .zero)
        self.backgroundColor = color
        self.setTitle(text, for: .normal)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 연산자, 피연산자 버튼 공통 속성
    func setup() {
        self.titleLabel?.font = .boldSystemFont(ofSize: 30)
        self.frame.size.height = 80
        self.frame.size.width = 80
//        self.layer.cornerRadius = 40
    }
}
