//
//  RegisterView.swift
//  TalkChat
//
//  Created by Italo Santana on 28/10/22.
//

import UIKit

class RegisterView: UIView {
    
    let createImageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: K.Images.createAccount)
        return image
    }()
    
    let strokeTextAttributes = [
        NSAttributedString.Key.strokeColor : UIColor.black,
        NSAttributedString.Key.foregroundColor : UIColor.white,
        NSAttributedString.Key.strokeWidth : -2.0,
        NSAttributedString.Key.font : UIFont(name: "Arial Hebrew Bold", size: 30)
    ] as [NSAttributedString.Key : Any]
    
    let userView: UIView = {
       let uView = UIView()
        uView.backgroundColor = .white
        uView.layer.cornerRadius = 20
        uView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        uView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        uView.layer.shadowOpacity = 0.18
        uView.layer.shadowRadius = 2.0
        uView.layer.masksToBounds = false
        return uView
    }()
    
    let userTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.font = .systemFont(ofSize: 20)
        textField.textAlignment = .center
        textField.borderStyle = .none
        return textField
    }()
    
    let emailView: UIView = {
        let eView = UIView()
        eView.backgroundColor = .white
        eView.layer.cornerRadius = 20
        eView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        eView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        eView.layer.shadowOpacity = 0.18
        eView.layer.shadowRadius = 2.0
        eView.layer.masksToBounds = false
        return eView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = .systemFont(ofSize: 20)
        textField.textAlignment = .center
        textField.borderStyle = .none
        return textField
    }()
    
    let passwordView: UIView = {
       let pView = UIView()
        pView.backgroundColor = .white
        pView.layer.cornerRadius = 20
        pView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        pView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        pView.layer.shadowOpacity = 0.18
        pView.layer.shadowRadius = 2.0
        pView.layer.masksToBounds = false
        return pView
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = .systemFont(ofSize: 20)
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let rePasswordView: UIView = {
       let pView = UIView()
        pView.backgroundColor = .white
        pView.layer.cornerRadius = 20
        pView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        pView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        pView.layer.shadowOpacity = 0.18
        pView.layer.shadowRadius = 2.0
        pView.layer.masksToBounds = false
        return pView
    }()
    
    let rePasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Password"
        textField.font = .systemFont(ofSize: 20)
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(hexaRGBA: K.Colors.mainColor)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainColor)?.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 5.0
        button.layer.masksToBounds = false
        return button
    }()
    
    let backgroundImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: K.Images.degrade2)
        return image
    }()
    
    let backgroundView: UIView = {
       let bView = UIView()
        bView.backgroundColor = .white
        bView.clipsToBounds = true
        bView.layer.cornerRadius = 80
        bView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainColor)?.cgColor
        bView.layer.shadowOffset = CGSize(width: 0.0, height: 20.0)
        bView.layer.shadowOpacity = 0.5
        bView.layer.shadowRadius = 20.0
        return bView
    }()

    var viewConstraintSize = 0.0
    var registerSize = 0.0
    var logoConstraintSize = 0.0
    
    init() {
        super.init(frame: .zero)
        if UIScreen.main.bounds.size.width <= 375 {
            viewConstraintSize = 15
            registerSize = 30
            logoConstraintSize = 15
        } else {
            viewConstraintSize = 50
            registerSize = 90
            logoConstraintSize = 40
        
    }
    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }


    func buildHierarchy() {
        self.backgroundColor = .white
        self.addSubview(createImageView)
        self.addSubview(backgroundView)
        backgroundView.addSubview(backgroundImage)
        backgroundView.addSubview(userView)
        userView.addSubview(userTextField)
        backgroundView.addSubview(emailView)
        emailView.addSubview(emailTextField)
        backgroundView.addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        backgroundView.addSubview(rePasswordView)
        rePasswordView.addSubview(rePasswordTextField)
        backgroundView.addSubview(registerButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        createImageView.translatesAutoresizingMaskIntoConstraints = false
        userView.translatesAutoresizingMaskIntoConstraints = false
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        emailView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        rePasswordView.translatesAutoresizingMaskIntoConstraints = false
        rePasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: CGFloat(logoConstraintSize)),
            createImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 55),
//            createImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -55),
            createImageView.heightAnchor.constraint(equalToConstant: 175),
            createImageView.widthAnchor.constraint(equalToConstant: 300),
            
            backgroundView.topAnchor.constraint(equalTo: createImageView.bottomAnchor, constant: CGFloat(viewConstraintSize)),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            userView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 67.5),
            userView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            userView.heightAnchor.constraint(equalToConstant: 40),
            userView.widthAnchor.constraint(equalToConstant: 336),
            
            userTextField.topAnchor.constraint(equalTo: userView.topAnchor, constant: 5),
            userTextField.leadingAnchor.constraint(equalTo: userView.leadingAnchor, constant:  5),
            userTextField.trailingAnchor.constraint(equalTo: userView.trailingAnchor, constant: -5),
            userTextField.bottomAnchor.constraint(equalTo: userView.bottomAnchor, constant: -5),
            
            emailView.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 30),
            emailView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            emailView.heightAnchor.constraint(equalToConstant: 40),
            emailView.widthAnchor.constraint(equalToConstant: 336),
            
            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 5),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -5),
            emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -5),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 30),
            passwordView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            passwordView.heightAnchor.constraint(equalToConstant: 40),
            passwordView.widthAnchor.constraint(equalToConstant: 336),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 5),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -5),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -5),
            
            rePasswordView.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 30),
            rePasswordView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            rePasswordView.heightAnchor.constraint(equalToConstant: 40),
            rePasswordView.widthAnchor.constraint(equalToConstant: 336),
            
            rePasswordTextField.topAnchor.constraint(equalTo: rePasswordView.topAnchor, constant: 5),
            rePasswordTextField.leadingAnchor.constraint(equalTo: rePasswordView.leadingAnchor, constant: 5),
            rePasswordTextField.trailingAnchor.constraint(equalTo: rePasswordView.trailingAnchor, constant: -5),
            rePasswordTextField.bottomAnchor.constraint(equalTo: rePasswordView.bottomAnchor, constant: -5),
            
            registerButton.topAnchor.constraint(equalTo: rePasswordView.bottomAnchor, constant: CGFloat(registerSize)),
            registerButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 60),
            registerButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
            backgroundImage.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0)
        ])
    }
}
    
