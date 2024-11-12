import UIKit

final class HorizontalStackView: UIStackView {
    init() {
        super.init(frame: .zero)
        
        self.axis = .horizontal
        self.backgroundColor = .black
        self.spacing = 10
        self.distribution = .fillEqually
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
