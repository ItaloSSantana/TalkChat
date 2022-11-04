//
//  MenuView.swift
//  TalkChat
//
//  Created by Italo Santana on 01/11/22.
//

import UIKit

class MenuView: UIView {
    
    let messagesLabel: UILabel = {
      let label = UILabel()
        label.text = "Mensagens"
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let mainMenuButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let addContactButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let configButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let contactsTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray6
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.backgroundColor = .systemGray6
        self.addSubview(messagesLabel)
        self.addSubview(searchButton)
        self.addSubview(contactsTableView)
       // self.addSubview(mainMenuButton)
      //  self.addSubview(addContactButton)
       // self.addSubview(configButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        messagesLabel.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        mainMenuButton.translatesAutoresizingMaskIntoConstraints = false
        addContactButton.translatesAutoresizingMaskIntoConstraints = false
        configButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messagesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            messagesLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            searchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            searchButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            searchButton.heightAnchor.constraint(equalToConstant: 52),
            searchButton.widthAnchor.constraint(equalToConstant: 52),
            
            contactsTableView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 31),
            contactsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            contactsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            contactsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        
        ])
    }
    
}
