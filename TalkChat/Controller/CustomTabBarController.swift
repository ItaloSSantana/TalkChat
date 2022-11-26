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
        let secondVC = SecondController()
        let menuVC = MenuViewController()
        self.setViewControllers([menuVC,firstVC,secondVC], animated: true)
        
        setupItems()
    }
    
    func setupItems() {
        guard let items = self.tabBar.items else {return}
        let images = [K.Images.mensageBubble, K.Images.settings, K.Images.logout]
   
        for x in 0...2 {
            items[x].image = UIImage(named: images[x])
        }
    }
}
