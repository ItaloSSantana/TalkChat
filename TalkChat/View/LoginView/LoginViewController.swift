import UIKit
import FirebaseDatabase
import FirebaseCore
import FirebaseAuth

class LoginViewController: UIViewController {
    lazy var welcomeScreen: LoginView = {
        let view = LoginView()
        view.loginAction = { [weak self] in
            self?.loginPressed()
        }
        
        view.registerAction = { [weak self] in
            self?.registerPressed()
        }
        
        view.googleAction = { [weak self] in
            print("google")
        }
        
        view.facebookAction = { [weak self] in
            print("facebook")
        }
        return view
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.barTintColor = .systemGray6
        navigationController?.isNavigationBarHidden = true
        navigationController?.isToolbarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = welcomeScreen
        welcomeScreen.buildHierarchy()
    }
    
    func registerPressed() {
        print("Registro")
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    func loginPressed() {
        if let email = welcomeScreen.emailTextField.text, let password = welcomeScreen.passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    let menuViewController = MenuTabBarController()
                    self.navigationController?.pushViewController(menuViewController, animated: true)
                }
            }
        }
    }
}

