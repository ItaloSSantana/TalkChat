//
//  CustomTabBarController.swift
//  TalkChat
//
//  Created by Italo on 22/11/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class MenuTabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        validateAuth()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = SettingsViewController()
        let menuVC = MenuViewController()
        let tabBarAppearence = UITabBarAppearance()
        tabBarAppearence.backgroundColor = .white
        tabBarAppearence.configureWithTransparentBackground()
        tabBarItem.standardAppearance = tabBarAppearence
        self.setViewControllers([menuVC,firstVC], animated: true)
        setupItems()
    }
    
    func validateAuth() {
       if FirebaseAuth.Auth.auth().currentUser == nil {
           let vc = LoginViewController()
           let nav = UINavigationController(rootViewController: vc)
           nav.modalPresentationStyle = .fullScreen
           present(nav, animated: false)
       }
   }
   
    func setupItems() {
        guard var items = self.tabBar.items else {return}
        let images = [K.Images.mensageBubble, K.Images.settings]
   
        for x in 0...1 {
            items[x].image = UIImage(named: images[x])?.withRenderingMode(.alwaysOriginal)
        }
    }
}
