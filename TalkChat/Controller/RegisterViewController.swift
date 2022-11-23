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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registerView
        navigationController?.isNavigationBarHidden = false
        ref = Database.database().reference()
        registerView.buildHierarchy()
        setupNavBar()
    }
    
   func setupNavBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .white
        navigationBarAppearance.configureWithTransparentBackground()
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.hidesBackButton = true
    SetBackBarButtonCustom()
    }
     
    func SetBackBarButtonCustom()
    {
        //Back buttion
        let btnLeftMenu: UIButton = UIButton()
        btnLeftMenu.setImage(UIImage(named: K.Images.leftArrow), for: UIControl.State())
        btnLeftMenu.addTarget(self, action: #selector(self.onClcikBack), for: .touchUpInside)
        btnLeftMenu.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        btnLeftMenu.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnLeftMenu.heightAnchor.constraint(equalToConstant: 35),
            btnLeftMenu.widthAnchor.constraint(equalToConstant: 35)
        ])
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
    }

    
    @objc func onClcikBack()
    {
        _ = self.navigationController?.popViewController(animated: true)
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
                        let menuViewController = MenuTabBarController()
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
