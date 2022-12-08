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
        label.text = "Messages"
        label.textColor = .white
        label.font = UIFont(name: "Avenir-Heavy", size: 45)
        label.clipsToBounds = true
        label.layer.shadowColor = UIColor(hexaRGBA: K.Colors.black)?.cgColor
        label.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        label.layer.shadowOpacity = 0.8
        label.layer.shadowRadius = 1.0
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: K.Images.addImage), for: .normal)
        button.setTitleColor(UIColor(hexaRGBA: K.Colors.mainColor), for: .normal)
        button.layer.cornerRadius = 50
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainColor)?.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 8.0
        button.layer.masksToBounds = false
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: K.Images.searchImage), for: .normal)
        button.setTitleColor(UIColor(hexaRGBA: K.Colors.mainColor), for: .normal)
        button.layer.cornerRadius = 50
        button.clipsToBounds = true
        button.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainColor)?.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 8.0
        button.layer.masksToBounds = false
        return button
    }()
    
    let contactsTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
        return tableView
    }()
    
    let backgroundImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: K.Images.background3)
        return image
    }()
    
    let backgroundView: UIView = {
       let bView = UIView()
        bView.backgroundColor = .white
        bView.clipsToBounds = true
        bView.layer.cornerRadius = 50
        bView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bView.layer.shadowColor = UIColor(hexaRGBA: K.Colors.mainColor)?.cgColor
        bView.layer.shadowOffset = CGSize(width: 0.0, height: 20.0)
        bView.layer.shadowOpacity = 0.5
        bView.layer.shadowRadius = 20.0
        return bView
    }()
    
    init() {
        super.init(frame: .zero)
        print(UIScreen.main.bounds.width)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.backgroundColor = .clear
        self.addSubview(backgroundImage)
        self.addSubview(messagesLabel)
        self.addSubview(backgroundView)
        backgroundView.addSubview(contactsTableView)
        backgroundView.addSubview(addButton)
        backgroundView.addSubview(searchButton)
        setupConstraints()
    }

    func setupConstraints() {
        
        messagesLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messagesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            messagesLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            messagesLabel.widthAnchor.constraint(equalToConstant: 300),
            
            addButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25),
            addButton.heightAnchor.constraint(equalToConstant: 32),
            addButton.widthAnchor.constraint(equalToConstant: 32),
            
            searchButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            searchButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -25),
            searchButton.heightAnchor.constraint(equalToConstant: 32),
            searchButton.widthAnchor.constraint(equalToConstant: 32),
            
            backgroundView.topAnchor.constraint(equalTo: messagesLabel.bottomAnchor, constant: 60),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            contactsTableView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 80),
            contactsTableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 0),
            contactsTableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 0),
            contactsTableView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0),
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
