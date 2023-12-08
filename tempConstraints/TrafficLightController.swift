import UIKit
import SnapKit

class TrafficLightController: UIViewController {
    private let trafficLightView = TrafficLightView()
    private let stackButton = ButtonsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTraficLightView()
        configureButton()
    }
    
    private func configureTraficLightView(){
        //MARK: - trafficLightView
        view.addSubview(trafficLightView)
    }
    private func configureButton(){
        //MARK: - switchButton and addTarget
        view.addSubview(stackButton)
        stackButton.switchButton.addTarget(self, action: #selector(buttonSwitchTarget(sender: )), for: .touchUpInside)
        stackButton.deleteButton.addTarget(self, action: #selector(buttonDeleteTarget(sender: )), for: .touchUpInside)
        stackButton.addButton.addTarget(self, action: #selector(buttonAddTarget(sender: )), for: .touchUpInside)
    }
    
    @objc func buttonSwitchTarget(sender: UIButton) {
        trafficLightView.switchLight()
    }
    @objc func buttonDeleteTarget(sender: UIButton) {
        trafficLightView.removeLastSection()

    }
    @objc func buttonAddTarget(sender: UIButton) {
        trafficLightView.addAdditionalSection()
    }
}

#Preview{
    TrafficLightController()
}




