//
//  MainScreenView.swift
//  TalkChat
//
//  Created by Italo Santana on 28/10/22.

import UIKit

class LoginView: UIView {
    private lazy var logoImageView: UIImageView = {
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
    
     lazy var emailTextField: UITextField = {
       let textField = UITextField()
        textField.font = .systemFont(ofSize: 20)
        textField.placeholder = "Email"
        textField.text = "1@2.com"
        textField.textAlignment = .center
        textField.borderStyle = .none
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
       let textField = UITextField()
        textField.font = .systemFont(ofSize: 20)
        textField.placeholder = "Password"
        textField.text = "123456"
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private lazy var emailView: UIView = {
       let emailView = UIView()
        emailView.backgroundColor = .white
        emailView.layer.cornerRadius = 20
        emailView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        emailView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        emailView.layer.shadowOpacity = 0.18
        emailView.layer.shadowRadius = 2.0
        emailView.layer.masksToBounds = false
        return emailView
    }()
    
    private lazy var passwordView: UIView = {
       let passwordView = UIView()
        passwordView.backgroundColor = .white
        passwordView.layer.cornerRadius = 20
        passwordView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        passwordView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        passwordView.layer.shadowOpacity = 0.18
        passwordView.layer.shadowRadius = 2.0
        passwordView.layer.masksToBounds = false
        return passwordView
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.titleLabel?.tintColor = .white
        button.backgroundColor = UIColor(hexaRGBA: K.Colors.mainColor)
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainColor)?.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 22.0
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerLabel: UILabel = {
       let label = UILabel()
        label.text = "Not a member yet?"
        return label
    }()
    
    private lazy var registerButton: UIButton = {
      let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 21)
        button.titleLabel?.tintColor = UIColor(hexaRGBA: K.Colors.mainColor)
        button.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        return button
    }()

    private lazy var registerView: UIView = {
       let rView = UIView()
        rView.backgroundColor = .clear
        return rView
    }()
    
    private lazy var registerStackView: UIStackView = {
       let stack = UIStackView()
        stack.spacing = 5
        stack.alignment = .fill
        stack.distribution = .fill
        stack.contentMode = .scaleToFill
        return stack
    }()

    private lazy var loginStack: UIStackView = {
       let stack = UIStackView()
        stack.spacing = 25
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
   
    private lazy var whiteView: UIView = {
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
    
    private lazy var backgroundGradient: UIImageView = {
       let background = UIImageView()
        background.image = UIImage(named: K.Images.degrade)
        background.contentMode = .scaleToFill
        return background
    }()
    
    private lazy var google: ButtonInsertIcon = {
        let button = ButtonInsertIcon(title: "Google", icon: K.Images.logout)
        button.action = {
            self.googleAction()
        }
        return button
    }()
    
    private lazy var facebook: ButtonInsertIcon = {
        let button = ButtonInsertIcon(title: "Facebook", icon: K.Images.logout)
        button.action = {
            self.facebookAction()
        }
        return button
    }()
    
    var loginAction: () -> Void = { /* Intentionally unimplemented */ }
    var registerAction: () -> Void = { /* Intentionally unimplemented */ }
    var googleAction: () -> Void = { /* Intentionally unimplemented */ }
    var facebookAction: () -> Void = { /* Intentionally unimplemented */ }
    
    var viewConstraintSize = 0
    var logoConstraintSize = 0
    var roundSize = 0
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    init() {
        super.init(frame: .zero)
        if UIScreen.main.bounds.size.width <= 375 {
            viewConstraintSize = -45
            roundSize = 140
            logoConstraintSize = 60
        } else {
            viewConstraintSize = -90
            roundSize = 160
            logoConstraintSize = 180
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func loginPressed() {
        loginAction()
    }
    
    @objc
    func registerPressed() {
        registerAction()
    }
    
    func buildHierarchy() {
        self.backgroundColor = UIColor(hexaRGBA: K.Colors.secondColor)
        addSubview(backgroundGradient)
        addSubview(registerStackView)
        registerStackView.addArrangedSubview(registerLabel)
        registerStackView.addArrangedSubview(registerButton)
        addSubview(whiteView)
        whiteView.addSubview(logoImageView)
        addSubview(emailView)
        emailView.addSubview(emailTextField)
        addSubview(passwordView)
        passwordView.addSubview(passwordTextField)
        addSubview(loginButton)
       // addSubview(googleLogin)
       // addSubview(facebookLogin)
        //addSubview(loginStack)
        addSubview(google)
        addSubview(facebook)
//        let google = ButtonInsertIcon(title: "Google", icon: K.Images.logout)
//        loginStack.addArrangedSubview(google)
//        let facebook = ButtonInsertIcon(title: "Facebook", icon: K.Images.settings)
//        loginStack.addArrangedSubview(facebook)
        whiteView.layer.cornerRadius = CGFloat(roundSize)
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
        backgroundGradient.translatesAutoresizingMaskIntoConstraints = false
        google.translatesAutoresizingMaskIntoConstraints = false
        facebook.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            backgroundGradient.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundGradient.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundGradient.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundGradient.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            whiteView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: emailView.topAnchor, constant: CGFloat(viewConstraintSize)),
            whiteView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 43),
            whiteView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -43),
            
            logoImageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: CGFloat(logoConstraintSize)),
            //logoImageView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -52),
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
            logoImageView.widthAnchor.constraint(equalToConstant: 250),
            logoImageView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor),
            
           // emailView.topAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: 120),
            emailView.bottomAnchor.constraint(equalTo: passwordView.topAnchor, constant: -30),
            emailView.heightAnchor.constraint(equalToConstant: 40),
            emailView.widthAnchor.constraint(equalToConstant: 336),
            emailView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            emailTextField.centerXAnchor.constraint(equalTo: emailView.centerXAnchor),
            emailTextField.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 60),
            
           // passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 30),
            passwordView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -30),
            passwordView.heightAnchor.constraint(equalToConstant: 40),
            passwordView.widthAnchor.constraint(equalToConstant: 336),
            passwordView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            passwordTextField.centerXAnchor.constraint(equalTo: passwordView.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            
            //loginButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 30),
            loginButton.bottomAnchor.constraint(equalTo: registerStackView.topAnchor, constant: -25),
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 42),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -42),
            loginButton.heightAnchor.constraint(equalToConstant: 46),
            
            //registerStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            //registerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 92),
            //registerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -96),
            registerStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            registerStackView.bottomAnchor.constraint(equalTo: google.topAnchor, constant: -20),
    
            google.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 70),
            google.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            google.widthAnchor.constraint(equalToConstant: 130),
            
            facebook.leadingAnchor.constraint(equalTo: google.trailingAnchor, constant: 10),
            facebook.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            facebook.widthAnchor.constraint(equalToConstant: 130)
            
        ])
    }
}
