//
//  Temp.swift
//  TalkChat
//
//  Created by Italo Santana on 07/11/22.
//

import Foundation

//func loadFriends() {
//    let userRef = self.ref.child("users")
//    userRef.observeSingleEvent(of: .value) { (snapshot) in
//        for snap in snapshot.children {
//            if let document = (snap as? DataSnapshot)?.key {
//                if let safeDoc = (document as? String) {
//                    self.uidArray.append(safeDoc)
//                }
//            }
//        }
//        self.uidArray.forEach { document in
//            let friendRef = self.ref.child("users").child(document)
//            friendRef.observeSingleEvent(of: .value) { snapshot in
//                guard let dict = snapshot.value as? [String:Any] else {
//                    print("Error")
//                    return
//                }
//                let user = dict["user"] as? String
//                let email = dict["email"] as? String
//                print(user,email)
//            }
//        }
//    }
//}

