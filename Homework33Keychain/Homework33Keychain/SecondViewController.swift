import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    let login = KeychainController.shared.getValue(for: "Login")
    let password = KeychainController.shared.getValue(for: "Password")
    let key = KeychainController.shared.getValue(for: "Key")
    
    var keyModel: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginLabel.text = "Login: \(login ?? "")"
        passwordLabel.text = "Password: \(password ?? "")"
        keyLabel.text = "Key: \(key ?? "")"
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
