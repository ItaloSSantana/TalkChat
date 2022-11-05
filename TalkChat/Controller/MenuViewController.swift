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

    let menuView: MenuView = {
        let buttonPressed = MenuView()
        buttonPressed.addButton.addTarget(self, action: #selector(getFriends), for: .touchUpInside)
        return buttonPressed
    }()
    let menuCell = MenuTableViewCell()
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
       
        menuView.contactsTableView.dataSource = self
        menuView.contactsTableView.delegate = self
        ref = Database.database().reference()
        menuView.buildHierarchy()
    }
    
    @objc func getFriends() {
        let alert = UIAlertController(title: "Adicionar amigo.", message: "Insira o email do seu amigo", preferredStyle: .alert)
        let add = UIAlertAction(title: "Adicionar", style: .default, handler: { action in
            if let emailTextfield = alert.textFields?[0] {
                print(emailTextfield.text)
            }
        })
        
        let cancel = UIAlertAction(title: "Cancelar", style: .default, handler: { action in
        })
        
        add.setValue(UIColor(hexaRGBA: K.Colors.mainRed), forKey: "titleTextColor")
        cancel.setValue(UIColor(hexaRGBA: K.Colors.mainRed), forKey: "titleTextColor")
        alert.addTextField { (textfield: UITextField) in
            textfield.placeholder = "Email do amigo"
        }
        alert.addAction(add)
        alert.addAction(cancel)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
    })
    }
    
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as? MenuTableViewCell {
            cell.buildCellHierarchy()
            cell.backgroundColor = .clear
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
}

    
    
    

