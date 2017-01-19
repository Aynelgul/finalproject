//
//  User.swift
//  finalproject
//
//  Created by Aynel Gül on 18-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let email: String
    let key: String
//    let username: String
    
    let ref: FIRDatabaseReference?
    
    init(authData: FIRUser) {
        uid = authData.uid
        email = authData.email!
        key = ""
        ref = nil
    }
    
    init(uid: String, email: String, key: String = "") {
        // evt dit er nog in: username: String
        self.uid = uid
        self.email = email
        self.key = key
//        self.username = username
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value! as! [String: AnyObject]
        uid = snapshotValue["uid"] as! String
        email = snapshotValue["email"] as! String
        key = snapshot.key
//        username = snapshotValue["username"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "uid": uid,
            "email": email
//            "username": username
        ]
    }
    
}
