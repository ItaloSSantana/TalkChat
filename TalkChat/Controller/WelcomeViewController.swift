//
//  ViewController.swift
//  TalkChat
//
//  Created by Italo Santana on 28/10/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    lazy var welcomeScreen: WelcomeView = {
        let screenActions = WelcomeView()
        screenActions.registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        return screenActions
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view = welcomeScreen
        welcomeScreen.buildHierarchy()
    }
    
    @objc func registerPressed(sender: UIButton) {
        print("Registro")
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
}

