//
//  ChatViewController.swift
//  TalkChat
//
//  Created by Italo Santana on 04/11/22.
//

import UIKit
import MessageKit

class ChatViewController: MessagesViewController{

    let chatView = ChatView()
    
    var messages: [Message] = []
    
    let currentUser = Sender(senderId: "self", displayName: "Italo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
    }
}

extension ChatViewController: MessagesLayoutDelegate, MessagesDataSource, MessagesDisplayDelegate, MessageInputBarDelegate {
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func inputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        
        messages.append(Message(sender: currentUser, messageId: "123", sentDate: Date(), kind: .text(text)))
        messagesCollectionView.reloadData()
    }
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct Sender: SenderType {
    var senderId: String
    var displayName: String
    
}
