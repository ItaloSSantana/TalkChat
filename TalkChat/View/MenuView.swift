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
    
    let addButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: K.Images.addImage), for: .normal)
        button.setTitleColor(UIColor(hexaRGBA: K.Colors.mainRed), for: .normal)
        button.layer.cornerRadius = 50
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainRed)?.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 8.0
        button.layer.masksToBounds = false
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
    
    let backgroundImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: K.Images.background3)
        return image
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.backgroundColor = .clear
        self.addSubview(backgroundImage)
        self.addSubview(messagesLabel)
        self.addSubview(contactsTableView)
        self.addSubview(addButton)
        contactsTableView.backgroundColor = .clear
        setupConstraints()
    }
    
    func setupConstraints() {
        
        messagesLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messagesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            messagesLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25),
            addButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 52),
            addButton.widthAnchor.constraint(equalToConstant: 52),
            
            contactsTableView.topAnchor.constraint(equalTo: messagesLabel.bottomAnchor, constant: 90),
            contactsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            contactsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            contactsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            backgroundImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
