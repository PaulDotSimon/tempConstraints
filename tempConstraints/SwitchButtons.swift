import UIKit

class ButtonsView: UIView{
    private let buttonStack = UIStackView()
//    let buttonsArray: Array<UIButton>
    var switchButton: UIButton
    var deleteButton: UIButton
    var addButton: UIButton
    private let buttonsArray: Array<UIButton> =
    [
        SwitchButton(width: 100, height: 45, backgroundColor: .red, title: "Delete"),
        SwitchButton(width: 100, height: 45, backgroundColor: .blue, title: "Switch"),
        SwitchButton(width: 100, height: 45, backgroundColor: .green, title: "Add")
    ]
    init(){
//        buttonsArray =    [
//                SwitchButton(width: 100, height: 45, backgroundColor: .red, title: "Delete"),
//                SwitchButton(width: 100, height: 45, backgroundColor: .blue, title: "Switch"),
//                SwitchButton(width: 100, height: 45, backgroundColor: .green, title: "Add")
//            ]
        deleteButton = buttonsArray[0]
        switchButton = buttonsArray[1]
        addButton = buttonsArray[2]
        super.init(frame: .zero)
        
        addSubview(buttonStack)
        //MARK: - buttonStack Constraints
        buttonStack.spacing = 10
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalCentering
        for button in buttonsArray{
            buttonStack.addArrangedSubview(button)
        }
        buttonStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didMoveToSuperview() {
        self.snp.makeConstraints { make in
            make.width.equalTo(superview!.snp.width).offset(-50)
            make.height.greaterThanOrEqualTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-50)
        }
    }
}

class SwitchButton: UIButton {
    init(width: CGFloat, height: CGFloat, backgroundColor: UIColor = .blue, title: String = "Button"){
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitle(title, for: .highlighted)
        setTitleColor(.white, for: .normal)
        setTitleColor(.darkGray, for: .highlighted)
        self.backgroundColor = backgroundColor
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        self.snp.makeConstraints{ snp in
            snp.height.equalTo(height)
            snp.width.equalTo(width)
        }
    }
    
    override func didMoveToSuperview() {
        self.snp.makeConstraints{ snp in
//            snp.centerX.equalToSuperview()
//            snp.bottom.equalTo(superview!.snp.bottom).offset(-50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
