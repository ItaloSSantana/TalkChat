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
    var friendsArray: [String] = []
    var uidArray: [String] = []
    var unsafeFriends: [String] = []
    
    var usersArray: [String] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = true
        navigationController?.isToolbarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        menuView.contactsTableView.dataSource = self
        menuView.contactsTableView.delegate = self
        ref = Database.database().reference()
        print(unsafeFriends.description)
        loadFriends()
        checkFriend()
        menuView.buildHierarchy()
    }
  
    @objc func getFriends() {
        let alert = UIAlertController(title: "Adicionar amigo.", message: "Insira o email do seu amigo", preferredStyle: .alert)
        let add = UIAlertAction(title: "Adicionar", style: .default, handler: { action in
            if let emailTextfield = alert.textFields?[0] {
                if let uid = Auth.auth().currentUser?.uid {
                    self.ref.child("users").child(uid).child("friends").childByAutoId().setValue(["friend": emailTextfield.text])
                }
            }
        })
        
        let cancel = UIAlertAction(title: "Cancelar", style: .default, handler: { action in
        })
        
        add.setValue(UIColor(hexaRGBA: K.Colors.mainColor), forKey: "titleTextColor")
        cancel.setValue(UIColor(hexaRGBA: K.Colors.mainColor), forKey: "titleTextColor")
        alert.addTextField { (textfield: UITextField) in
            textfield.placeholder = "Email do amigo"
        }
        alert.addAction(add)
        alert.addAction(cancel)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
    })
    
}
    func loadFriends() {
        guard let uid = Auth.auth().currentUser?.uid else{return}
            let userRef = self.ref.child("users").child(uid).child("friends")
            userRef.observeSingleEvent(of: .value) { (snapshot) in
                for snap in snapshot.children {
                    if let safeKey = (snap as? DataSnapshot)?.key {
                        self.uidArray.append(safeKey)
                    }
                }
                self.uidArray.forEach { document in
                    let friendRef = self.ref.child("users").child(uid).child("friends").child(document)
                    friendRef.observeSingleEvent(of: .value) { snapshot in
                        guard let dict = snapshot.value as? [String:Any] else {
                            print("Error")
                            return
                        }
                        if let friend = dict["friend"] as? String {
                            self.unsafeFriends.append(friend)
                            print(self.unsafeFriends.description)
                        }
                    }
                }
            }
    }
    
    func checkFriend() {
        let usersRef = self.ref.child("users")
        usersRef.observeSingleEvent(of: .value) { (snapshot) in
            for snap in snapshot.children {
                if let safeKey = (snap as? DataSnapshot)?.key {
                    self.usersArray.append(safeKey)
                }
            }
            self.usersArray.forEach { user in
                let friendRef = self.ref.child("users").child(user)
                friendRef.observeSingleEvent(of: .value) { (snapshot) in
                    guard let dict = snapshot.value as? [String: Any] else {
                        print("Error")
                        return
                    }
                    if let friendEmail = dict["email"] as? String {
                        
                    }
                }
            }
//            self.unsafeFriends.forEach { (friend) in
//                if friendEmail == friend {
//                    self.friendsArray.append(friendEmail)
//                  //  print("o email é:\(self.friendsArray.description)")
//                } else {
//                 //   print("\(friend) errado")
//                }
//            }
        }
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



