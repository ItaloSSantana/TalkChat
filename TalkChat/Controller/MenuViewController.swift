//
//  MenuViewController.swift
//  TalkChat
//
//  Created by Italo Santana on 01/11/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
class MenuViewController: UIViewController {

    let menuView = MenuView()
    let menuCell = MenuTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        menuView.contactsTableView.dataSource = self
        menuView.contactsTableView.delegate = self
        menuView.buildHierarchy()
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as? MenuTableViewCell {
            cell.buildCellHierarchy()
            print("Celula")
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
}

    
    
    

