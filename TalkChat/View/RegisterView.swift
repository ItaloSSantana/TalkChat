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
        return label
    }()
    
    let userView: UIView = {
       let uView = UIView()
        return uView
    }()
    
    let userTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    let emailView: UIView = {
        let eView = UIView()
        return eView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    let passwordView: UIView = {
       let pView = UIView()
        return pView
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    let registerButton: UIButton = {
       let button = UIButton()
        return button
    }()

    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
}
