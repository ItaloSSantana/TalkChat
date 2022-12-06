//
//  TestViewControllers.swift
//  TalkChat
//
//  Created by Italo on 23/11/22.
//
import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
   
    let settingsTableView: UITableView = {
       let table = UITableView()
        return table
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Profile"
        return label
    }()
    
    var data = ["Logout"]
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        setupHierarchy()
        setupTableView()
    }
    
    func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(settingsTableView)
    }
    
    func setupTableView() {
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            settingsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
        let actionSheet = UIAlertController(title: "Logout", message: "Are you sure you want do Log Out?", preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: {[weak self] _ in
                guard let strongSelf = self else {return}
                do {
                    try FirebaseAuth.Auth.auth().signOut()
                    let vc = LoginViewController()
                    let nav = UINavigationController(rootViewController: vc)
                    nav.modalPresentationStyle = .fullScreen
                    strongSelf.present(nav, animated: false)
                } catch  {
                    print("Failed to logout")
                }
            }))
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(actionSheet, animated: true)
        }
    }
    

