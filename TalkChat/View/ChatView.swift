//
//  ChatView.swift
//  TalkChat
//
//  Created by Italo Santana on 03/11/22.
//

import UIKit

class ChatView: UIView {

    let chatTableView: UITableView = {
       let tableView = UITableView()
        return tableView
    }()
    
    let chatTextfield: UITextField = {
       let textfield = UITextField()
        return textfield
    }()
    
    let sendButton: UIButton = {
      let button = UIButton()
        return button
    }()
    
    let sendView: UIView = {
        let send = UIView()
        return send
    }()
    
    let sendTextView: UIView = {
       let send = UIView()
        return send
    }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildChatHierarchy() {
        self.addSubview(chatTableView)
        self.addSubview(sendView)
        sendView.addSubview(sendTextView)
        sendTextView.addSubview(chatTextfield)
        sendView.addSubview(sendButton)
    }
    
    func setupChatConstraints() {
        chatTableView.translatesAutoresizingMaskIntoConstraints = false
        sendView.translatesAutoresizingMaskIntoConstraints = false
        chatTextfield.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            chatTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            chatTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            chatTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            chatTableView.heightAnchor.constraint(equalToConstant: 714),
            
            sendView.topAnchor.constraint(equalTo: chatTableView.bottomAnchor, constant: 0),
            sendView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            sendView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            sendView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            sendTextView.topAnchor.constraint(equalTo: sendView.topAnchor, constant: 18),
            sendTextView.leadingAnchor.constraint(equalTo: sendView.leadingAnchor, constant: 20),
            sendTextView.bottomAnchor.constraint(equalTo: sendView.bottomAnchor, constant: -30),
            sendTextView.widthAnchor.constraint(equalToConstant: 296),
            
            chatTextfield.topAnchor.constraint(equalTo: sendTextView.topAnchor, constant: 6),
            chatTextfield.leadingAnchor.constraint(equalTo: sendTextView.leadingAnchor, constant: 0),
            chatTextfield.trailingAnchor.constraint(equalTo: sendTextView.trailingAnchor, constant: 0),
            chatTextfield.bottomAnchor.constraint(equalTo: sendTextView.bottomAnchor, constant: -6),
            
            sendButton.topAnchor.constraint(equalTo: sendView.topAnchor, constant: 18),
            sendButton.leadingAnchor.constraint(equalTo: sendTextView.trailingAnchor, constant: 28),
            sendButton.heightAnchor.constraint(equalToConstant: 48),
            sendButton.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
}
