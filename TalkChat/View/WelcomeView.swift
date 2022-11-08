//
//  MainScreenView.swift
//  TalkChat
//
//  Created by Italo Santana on 28/10/22.

import UIKit

class WelcomeView: UIView {
    
    let logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: K.Images.logoImage)
        imageView.clipsToBounds = true
        imageView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainColor)?.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowRadius = -25.0
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 25.0
        return imageView
    }()
    
    let emailTextField: UITextField = {
       let textField = UITextField()
        textField.font = .systemFont(ofSize: 20)
        textField.placeholder = "Email"
        textField.text = "1@2.com"
        textField.textAlignment = .center
        textField.borderStyle = .none
        return textField
    }()
    
    let passwordTextField: UITextField = {
       let textField = UITextField()
        textField.font = .systemFont(ofSize: 20)
        textField.placeholder = "Password"
        textField.text = "123456"
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let emailView: UIView = {
       let emailView = UIView()
        emailView.backgroundColor = .white
        emailView.layer.cornerRadius = 20
        emailView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        emailView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        emailView.layer.shadowOpacity = 0.1
        emailView.layer.shadowRadius = 2.0
        emailView.layer.masksToBounds = false
        return emailView
    }()
    
    let passwordView: UIView = {
       let passwordView = UIView()
        
        passwordView.backgroundColor = .white
        passwordView.layer.cornerRadius = 20
        passwordView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        passwordView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        passwordView.layer.shadowOpacity = 0.1
        passwordView.layer.shadowRadius = 2.0
        passwordView.layer.masksToBounds = false
        return passwordView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.titleLabel?.tintColor = .white
        button.backgroundColor = UIColor(hexaRGBA: K.Colors.mainColor)
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainColor)?.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 20.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 22.0
        return button
    }()
    
    let registerLabel: UILabel = {
       let label = UILabel()
        label.text = "Not a member yet?"
        return label
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.titleLabel?.tintColor = UIColor(hexaRGBA: K.Colors.mainColor)
        return button
    }()
    
    let registerStackView: UIStackView = {
       let stack = UIStackView()
        stack.spacing = 0
        stack.alignment = .fill
        stack.distribution = .fill
        stack.contentMode = .scaleToFill
        return stack
    }()
    
    let whiteView: UIView = {
       let wView = UIView()
        wView.backgroundColor = .white
        wView.clipsToBounds = true
        wView.layer.cornerRadius = 160
        wView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        wView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        wView.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        wView.layer.shadowOpacity = 0.2
        wView.layer.shadowRadius = 2.0
        wView.layer.masksToBounds = false
        return wView
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.backgroundColor = UIColor(hexaRGBA: K.Colors.secondColor)
        
        addSubview(registerStackView)
        addSubview(whiteView)
        whiteView.addSubview(logoImageView)
        registerStackView.addArrangedSubview(registerLabel)
        registerStackView.addArrangedSubview(registerButton)
        addSubview(emailView)
        emailView.addSubview(emailTextField)
        addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        addSubview(loginButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        emailView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registerStackView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            whiteView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            whiteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            logoImageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 180),
            logoImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 52),
            logoImageView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -52),
            logoImageView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -52),
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
            logoImageView.widthAnchor.constraint(equalToConstant: 250),
            
            emailView.topAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: 120),
            emailView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 39),
            emailView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -38),
            emailView.heightAnchor.constraint(equalToConstant: 40),
            emailView.widthAnchor.constraint(equalToConstant: 336),
            
            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 5),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -5),
            emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -5),
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 30),
            passwordView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 39),
            passwordView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -38),
            passwordView.heightAnchor.constraint(equalToConstant: 40),
            passwordView.widthAnchor.constraint(equalToConstant: 336),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 5),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -5),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -5),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            
            loginButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 42),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -42),
            loginButton.heightAnchor.constraint(equalToConstant: 46),
            
            registerStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 92),
            registerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -96),
           // registerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -18)
        ])
        
    }
}
