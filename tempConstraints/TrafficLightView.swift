import UIKit

extension Array where Element == TrafficLightSectionView{
    mutating func addAdditionalSection(){
        self.append(TrafficLightSectionView(colorLight: Colors.randomColor()))
    }
    mutating func removeLastSection(){
        self.removeLast()
    }
    
}

class TrafficLightView: UIView{
    private var sectionsView: [TrafficLightSectionView] =
    [
        TrafficLightSectionView(colorLight: Colors.randomColor()),
        TrafficLightSectionView(colorLight: .yellow),
        TrafficLightSectionView(colorLight: .green),
        TrafficLightSectionView(colorLight: .blue),
        TrafficLightSectionView(colorLight: .brown),
        TrafficLightSectionView(colorLight: Colors.randomColor())
    ]
    
    private  let stackView = UIStackView()
    
    init(){
        super.init(frame: .zero)
        configureStackView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been imolemented")
    }
    
    override func didMoveToSuperview() {
        self.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.greaterThanOrEqualTo(300)
            //            make.height.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalTo(80)
        }
    }
    //MARK: - func switchLight
    @objc func switchLight(){
        if let indexOfFirstOnSection = sectionsView.firstIndex(where: { $0.isOn() }){
            sectionsView[indexOfFirstOnSection].turnOff()
            if indexOfFirstOnSection != (sectionsView.count - 1){
                sectionsView[indexOfFirstOnSection + 1].turnOn()
            } else{
                sectionsView.first?.turnOn()
            }
        } else{
            sectionsView.first?.turnOn()
        }
    }
    func removeLastSection() -> (){
        sectionsView.removeLastSection()
    }
    
    func addAdditionalSection() -> (){
        sectionsView.addAdditionalSection()
    }
    private func configureStackView() -> () {
        //MARK: - UIStackView addSubview
        addSubview(stackView)
        
        //MARK: - UIStackView Constraints
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        //MARK: - SectionView Constraints
        for section in sectionsView{
            ///SectionView Constraints
            section.snp.makeConstraints { make in make.width.height.equalTo(100)
            }
            stackView.addArrangedSubview(section)
        }
        //stackView.addArrangedSubview(firstSectionView)
        //stackView.addArrangedSubview(secondSectionView)
        //stackView.addArrangedSubview(thirdSectionView)
        stackView.snp.makeConstraints { make in
            //make.width.equalTo(300)
            //make.height.greaterThanOrEqualTo(300)
            //make.top.equalTo(100)
            //make.centerX.equalToSuperview()
            make.edges.equalToSuperview()
        }
    }
}

