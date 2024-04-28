import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSelection()
    }
    
    func screenSelection() {
        if KeychainController.shared.getValue(for: "Login") != nil {
            let mainStoryBoard = UIStoryboard(name: "SecondViewController", bundle: nil)
            let secondViewController = mainStoryBoard.instantiateInitialViewController()
            setRootViewController(secondViewController!)
        } else {
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginViewController")
            setRootViewController(loginViewController)
        }
    }
    
    func setRootViewController(_ vc: UIViewController) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vc
    }
}

