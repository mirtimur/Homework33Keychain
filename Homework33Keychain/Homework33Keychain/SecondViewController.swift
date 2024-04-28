import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    let login = KeychainController.shared.getValue(for: "Login")
    let password = KeychainController.shared.getValue(for: "Password")
    let key = KeychainController.shared.getValue(for: "Key")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginLabel.text = "Login: \(login ?? "")"
        passwordLabel.text = "Password: \(password ?? "")"
        keyLabel.text = "Key: \(key ?? "")"
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        deleteKeychainValues()
        openLoginController()
    }
    
    private func deleteKeychainValues() {
        KeychainController.shared.removeValue(for: "Login")
    }
    
    private func openLoginController() {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = mainStoryBoard.instantiateViewController(withIdentifier: "LoginViewController")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = loginViewController
    }
}
