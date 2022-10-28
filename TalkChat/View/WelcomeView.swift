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
        imageView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainRed)?.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowRadius = -25.0
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 25.0
        return imageView
    }()
    
    let emailTextField: UITextField = {
       let textField = UITextField()
        textField.font = .systemFont(ofSize: 23)
        textField.placeholder = "Email"
        textField.textAlignment = .center
        textField.borderStyle = .none
        return textField
    }()
    
    let passwordTextField: UITextField = {
       let textField = UITextField()
        textField.font = .systemFont(ofSize: 23)
        textField.placeholder = "Senha"
        textField.textAlignment = .center
        textField.borderStyle = .none
        return textField
    }()
    
    let emailView: UIView = {
       let emailView = UIView()
        emailView.backgroundColor = .white
        emailView.layer.cornerRadius = 35
        return emailView
    }()
    
    let passwordView: UIView = {
       let passwordView = UIView()
        
        passwordView.backgroundColor = .white
        passwordView.layer.cornerRadius = 35
        return passwordView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.titleLabel?.tintColor = .white
        button.backgroundColor = UIColor(hexaRGBA: K.Colors.mainRed)
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainRed)?.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 25.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 25.0
        return button
    }()
    
    let registerLabel: UILabel = {
       let label = UILabel()
        label.text = "Ainda não é um membro?"
        return label
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registre-se", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.titleLabel?.tintColor = UIColor(hexaRGBA: K.Colors.mainRed)
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
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.backgroundColor = .systemGray6
        addSubview(registerStackView)
        registerStackView.addArrangedSubview(registerLabel)
        registerStackView.addArrangedSubview(registerButton)
        addSubview(logoImageView)
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
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 43),
            logoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 82),
            logoImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -82),
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
            logoImageView.widthAnchor.constraint(equalToConstant: 250),
            emailView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 18),
            emailView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 39),
            emailView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -39),
            emailView.heightAnchor.constraint(equalToConstant: 69),
            emailView.widthAnchor.constraint(equalToConstant: 336),
            
            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: -8),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: -9),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -9),
            emailTextField.heightAnchor.constraint(equalToConstant: 85),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 30),
            passwordView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 39),
            passwordView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -39),
            passwordView.heightAnchor.constraint(equalToConstant: 69),
            passwordView.widthAnchor.constraint(equalToConstant: 336),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: -8),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: -9),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -9),
            passwordTextField.heightAnchor.constraint(equalToConstant: 85),
            
            loginButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 25),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 42),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -42),
            loginButton.heightAnchor.constraint(equalToConstant: 54),
            
            registerStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 4),
            registerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            registerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -54),
           // registerStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -18)
        ])
        
    }
}
