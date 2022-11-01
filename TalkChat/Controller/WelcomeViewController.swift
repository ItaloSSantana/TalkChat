//
//  ViewController.swift
//  TalkChat
//
//  Created by Italo Santana on 28/10/22.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import FirebaseAuth

class WelcomeViewController: UIViewController {

    lazy var welcomeScreen: WelcomeView = {
        let screenActions = WelcomeView()
        screenActions.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        screenActions.loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return screenActions
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.barTintColor = .systemGray6
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.isToolbarHidden = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view = welcomeScreen
        welcomeScreen.buildHierarchy()
    }
    
    @objc func registerPressed(sender: UIButton) {
        print("Registro")
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    @objc func loginPressed() {
        if let email = welcomeScreen.emailTextField.text, let password = welcomeScreen.passwordTextField.text {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
            } else {
                let menuViewController = MenuViewController()
                self.navigationController?.pushViewController(menuViewController, animated: true)
            }
        }
        }
    }
    
}

