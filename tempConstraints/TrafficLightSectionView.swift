import UIKit

enum Colors: CaseIterable{
    
    case red, yellow, green, blue, brown, clear, pink, magenta
    func color() -> UIColor{
        switch self {
        case .red: return .red
        case .yellow: return .yellow
        case .green: return .green
        case .blue: return .blue
        case .brown: return .brown
        case .pink: return .systemPink
        case .magenta: return .magenta
        case .clear: return .clear
        }
    }
    
    static func randomColor() -> Colors {
        var variant: Colors
        repeat{
            variant = Colors.allCases.randomElement()!
        }while variant == .clear
        return variant
    }
}

class TrafficLightSectionView: UIView {
    
    private var colorLight: Colors = .clear
    
    init(colorLight: Colors) {
        super.init(frame: .zero)
        self.colorLight = colorLight
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupView()
    }
    func setColorLight(_ colorLight: Colors) -> () {
        self.colorLight = colorLight
    }
    
    private func setupView() {
        layer.cornerRadius = frame.size.width / 2
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = .clear
    }
    func turnOn() {
        backgroundColor = colorLight.color()
    }
    func turnOff() -> Void {
        backgroundColor = .clear
    }
    func isOff() -> Bool {
        if backgroundColor == .clear { true }
        else{ false }
    }
    func isOn() -> Bool {
        if backgroundColor != .clear { true }
        else{ false }
    }
}
