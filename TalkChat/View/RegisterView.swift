//
//  RegisterView.swift
//  TalkChat
//
//  Created by Italo Santana on 28/10/22.
//

import UIKit

class RegisterView: UIView {
    
    let createLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
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

    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildHierarchy() {
        self.backgroundColor = .systemGray6
        self.addSubview(backgroundImage)
        self.addSubview(createLabel)
        createLabel.attributedText = NSMutableAttributedString(string: "Create your account!", attributes: strokeTextAttributes)
        self.addSubview(userView)
        userView.addSubview(userTextField)
        self.addSubview(emailView)
        emailView.addSubview(emailTextField)
        self.addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        self.addSubview(rePasswordView)
        rePasswordView.addSubview(rePasswordTextField)
        self.addSubview(registerButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        createLabel.translatesAutoresizingMaskIntoConstraints = false
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
        
        NSLayoutConstraint.activate([
        
            createLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 39),
            createLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 55),
            createLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -55),
            
            userView.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 47.5),
            userView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 67),
            userView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -66),
            userView.heightAnchor.constraint(equalToConstant: 40),
            
            userTextField.topAnchor.constraint(equalTo: userView.topAnchor, constant: 5),
            userTextField.leadingAnchor.constraint(equalTo: userView.leadingAnchor, constant:  5),
            userTextField.trailingAnchor.constraint(equalTo: userView.trailingAnchor, constant: -5),
            userTextField.bottomAnchor.constraint(equalTo: userView.bottomAnchor, constant: -5),
            
            emailView.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 30),
            emailView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 67),
            emailView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -66),
            emailView.heightAnchor.constraint(equalToConstant: 40),
            
            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 5),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -5),
            emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -5),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 30),
            passwordView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 67),
            passwordView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -66),
            passwordView.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 5),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -5),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -5),
            
            rePasswordView.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 30),
            rePasswordView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 67),
            rePasswordView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -66),
            rePasswordView.heightAnchor.constraint(equalToConstant: 40),
            
            rePasswordTextField.topAnchor.constraint(equalTo: rePasswordView.topAnchor, constant: 5),
            rePasswordTextField.leadingAnchor.constraint(equalTo: rePasswordView.leadingAnchor, constant: 5),
            rePasswordTextField.trailingAnchor.constraint(equalTo: rePasswordView.trailingAnchor, constant: -5),
            rePasswordTextField.bottomAnchor.constraint(equalTo: rePasswordView.bottomAnchor, constant: -5),
            
            registerButton.topAnchor.constraint(equalTo: rePasswordView.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 60),
            registerButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            
            backgroundImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
