import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        buttonConfidure()
    }
    
    func buttonConfidure() {
        loginButton.layer.cornerRadius = 10
    }
    
    func presentSecondViewController() {
        let storyboard = UIStoryboard(name: "SecondViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
    
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func addNotification() {
        let message = "Please log back in to your account!"
        let content = UNMutableNotificationContent()
        content.body = message
        content.sound = UNNotificationSound.default
        let date = Calendar.current.startOfDay(for: Date())
        let tomorrow = date + (60*60*24)
        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: tomorrow)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if loginTextField.hasText && passwordTextField.hasText {
            KeychainController.shared.set(loginTextField.text ?? "", for: "Login")
            KeychainController.shared.set(passwordTextField.text ?? "", for: "Password")
            KeychainController.shared.set(UUID().uuidString, for: "Key")
            addNotification()
            presentSecondViewController()
        }
    }
}
