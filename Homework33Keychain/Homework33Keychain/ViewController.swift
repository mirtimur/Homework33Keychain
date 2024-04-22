import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(KeychainController.shared.getValue(for: "Login"))
//        print(KeychainController.shared.getValue(for: "Password"))
//        KeychainController.shared.clean()
        buttonConfidure()
    }
    
    func buttonConfidure() {
        loginButton.layer.cornerRadius = 10
    }
    
    func presentSecondViewController() {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        vc.modalPresentationStyle = .fullScreen
        vc.keyModel = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if loginTextField.hasText && passwordTextField.hasText {
            KeychainController.shared.set(loginTextField.text ?? "", for: "Login")
            KeychainController.shared.set(passwordTextField.text ?? "", for: "Password")
            KeychainController.shared.set(UUID().uuidString, for: "Key")
            presentSecondViewController()
        }
    }
    
}

