//
//  MenuMessagesCellTableViewCell.swift
//  TalkChat
//
//  Created by Italo Santana on 01/11/22.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class MenuTableViewCell: UITableViewCell {

    static let identifier = "menuCell"
    
    //let ref: DatabaseReference!
    
    let contactImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: K.Images.logoImage)
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        return image
    }()
    
    let contactNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Nome do Contato"
        return label
    }()
    
    let messageLabel: UILabel = {
      let label = UILabel()
        label.text = "MENSAGEM MENSAGEM MENSAGEM MENSAGEM"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()
    
    let timeLabel: UILabel = {
       let label = UILabel()
        label.text = "13:30"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func buildCellHierarchy() {
        contentView.addSubview(contactImageView)
        contentView.addSubview(contactNameLabel)
        contentView.addSubview(messageLabel)
        contentView.addSubview(timeLabel)
        setupCellConstraints()
    }
    
    func setupCellConstraints() {
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            contactImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            contactImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            contactImageView.heightAnchor.constraint(equalToConstant: 68),
            contactImageView.widthAnchor.constraint(equalToConstant: 68),
            
            contactNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            contactNameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 17),
            
            messageLabel.topAnchor.constraint(equalTo: contactNameLabel.bottomAnchor, constant: 16),
            messageLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 17),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -85),
            
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        
        ])
    }
    
}
