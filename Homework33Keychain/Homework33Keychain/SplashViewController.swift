import UIKit

class SplashViewController: UIViewController {
    
    var viewControllerModel: ViewController?
    var secondViewControllerModel: SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSelection()
    }
    
    func screenSelection() {
        if let key = KeychainController.shared.getValue(for: "Login") {
            viewControllerModel?.presentSecondViewController()
        } else {
          
        }
    }
}

