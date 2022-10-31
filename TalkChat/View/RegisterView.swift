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
        label.text = "Crie sua conta!"
        label.font = .systemFont(ofSize: 27)
        label.textAlignment = .center
        return label
    }()
    
    let userView: UIView = {
       let uView = UIView()
        uView.layer.cornerRadius = 25
        uView.backgroundColor = .white
        return uView
    }()
    
    let userTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Usuário"
        textField.font = .systemFont(ofSize: 21)
        textField.textAlignment = .center
        textField.borderStyle = .none
        return textField
    }()
    
    let emailView: UIView = {
        let eView = UIView()
        eView.layer.cornerRadius = 25
        eView.backgroundColor = .white
        return eView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = .systemFont(ofSize: 21)
        textField.textAlignment = .center
        textField.borderStyle = .none
        return textField
    }()
    
    let passwordView: UIView = {
       let pView = UIView()
        pView.layer.cornerRadius = 25
        pView.backgroundColor = .white
        return pView
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.font = .systemFont(ofSize: 21)
        textField.textAlignment = .center
        textField.borderStyle = .none
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registrar", for: .normal)
        button.backgroundColor = UIColor(hexaRGBA: K.Colors.mainRed)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainRed)?.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: -2.0)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 14.0
        button.layer.masksToBounds = false
        return button
    }()

    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildHierarchy() {
        self.backgroundColor = .systemGray6
        self.addSubview(createLabel)
        self.addSubview(userView)
        userView.addSubview(userTextField)
        self.addSubview(emailView)
        emailView.addSubview(emailTextField)
        self.addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
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
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            createLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 39),
            createLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 67),
            createLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -66),
            
            userView.topAnchor.constraint(equalTo: createLabel.bottomAnchor, constant: 47.5),
            userView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 67),
            userView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -66),
            userView.heightAnchor.constraint(equalToConstant: 55),
            
            userTextField.topAnchor.constraint(equalTo: userView.topAnchor, constant: -8),
            userTextField.leadingAnchor.constraint(equalTo: userView.leadingAnchor, constant:  -9),
            userTextField.trailingAnchor.constraint(equalTo: userView.trailingAnchor, constant: 9),
            userTextField.bottomAnchor.constraint(equalTo: userView.bottomAnchor, constant: 8),
            
            emailView.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 30),
            emailView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 67),
            emailView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -66),
            emailView.heightAnchor.constraint(equalToConstant: 55),
            
            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: -8),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: -9),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 9),
            emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 8),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 30),
            passwordView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 67),
            passwordView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -66),
            passwordView.heightAnchor.constraint(equalToConstant: 55),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: -8),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: -9),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: 9),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 8),
            
            registerButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 60),
            registerButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60),
            registerButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
