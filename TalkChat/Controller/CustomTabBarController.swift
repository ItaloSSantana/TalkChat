//
//  CustomTabBarController.swift
//  TalkChat
//
//  Created by Italo on 22/11/22.
//

import UIKit

class MenuTabBarController: UITabBarController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = FirstController()
        let welcomeVC = WelcomeViewController()
        let menuVC = MenuViewController()
        let tabBarAppearence = UITabBarAppearance()
        tabBarAppearence.backgroundColor = .white
        tabBarAppearence.configureWithTransparentBackground()
        tabBarItem.standardAppearance = tabBarAppearence
        self.setViewControllers([menuVC,firstVC,welcomeVC], animated: true)
        setupItems()
    }
    
    func setupItems() {
        guard var items = self.tabBar.items else {return}
        let images = [K.Images.mensageBubble, K.Images.settings, K.Images.logout]
   
        for x in 0...2 {
            items[x].image = UIImage(named: images[x])?.withRenderingMode(.alwaysOriginal)
        }
    }
}
