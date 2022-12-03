//
//  DatabaseManager.swift
//  TalkChat
//
//  Created by Italo on 03/12/22.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
}

    // MARK: - Account Management
    extension DatabaseManager {
        
        public func userExists(with email: String,
                               completion: @escaping ((Bool) -> Void)){
            database.child(email).observeSingleEvent(of: .value) { snapshot in
                guard snapshot.value as? String != nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
            
        }
        
        /// Inserts new user to database
    public func insertUser(user: ChatAppUser) {
        database.child(user.emailAddress).setValue([
            "userName": user.userName
        ])
    }
    
}

struct ChatAppUser {
    let userName: String
    let emailAddress: String
}
