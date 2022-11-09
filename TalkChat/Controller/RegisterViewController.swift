//
//  RegisterViewController.swift
//  TalkChat
//
//  Created by Italo Santana on 28/10/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase

class RegisterViewController: UIViewController {
    
    let registerView: RegisterView = {
        let screenActions = RegisterView()
        screenActions.registerButton.addTarget(self, action: #selector(registerButton), for: .touchUpInside)
        return screenActions
    }()
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registerView
        navigationController?.navigationBar.barTintColor = .white
        ref = Database.database().reference()
        registerView.buildHierarchy()
    }
    
    
    @objc func registerButton() {
        if let email = registerView.emailTextField.text, let password = registerView.passwordTextField.text, let username = registerView.userTextField.text, let rePassword = registerView.rePasswordTextField.text {
            if password == rePassword {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let erro = error {
                    print(erro)
                } else {
                    if let uid = Auth.auth().currentUser?.uid {
                        self.ref.child("users").child(uid).setValue(["username": username, "email": email, "uid": uid])
                        let menuViewController = MenuViewController()
                        self.navigationController?.pushViewController(menuViewController, animated: true)
                    }
                    }
                }
            } else {
                print("Not equal")
            }
        }
    }
}
