//
//  MainScreenView.swift
//  TalkChat
//
//  Created by Italo Santana on 28/10/22.

import UIKit

class MainScreenView: UIView {
    
    let logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: K.Images.logoImage)
        return imageView
    }()
    
    let emailTextField: UITextField = {
       let textField = UITextField()
        return textField
    }()
    
    let passwordTextField: UITextField = {
       let textField = UITextField()
        return textField
    }()
    
    let emailView: UIView = {
       let emailView = UIView()
        return emailView
    }()
    
    let passwordView: UIView = {
       let passwordView = UIView()
        return passwordView
    }()
    
    let loginButton: UIButton = {
       let button = UIButton()
        return button
    }()
    
    let registerLabel: UILabel = {
       let label = UILabel()
        label.text = "Ainda não é um membro?"
        return label
    }()
    
    let registerButton: UIButton = {
       let button = UIButton()
        return button
    }()
    
    let registerStackView: UIStackView = {
       let stack = UIStackView()
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        addSubview(logoImageView)
        addSubview(emailView)
        emailView.addSubview(emailTextField)
        addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(registerStackView)
        registerStackView.addArrangedSubview(registerLabel)
        registerStackView.addArrangedSubview(registerButton)
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
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 45),
            logoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 82),
            logoImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -82),
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
            logoImageView.widthAnchor.constraint(equalToConstant: 250)
        ])
        
    }
}
