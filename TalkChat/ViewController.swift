//
//  ViewController.swift
//  TalkChat
//
//  Created by Italo Santana on 28/10/22.
//

import UIKit

class ViewController: UIViewController {

    let mainScreenView = MainScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainScreenView
        mainScreenView.buildHierarchy()
    }
}

