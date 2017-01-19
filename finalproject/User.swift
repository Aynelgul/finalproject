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
    
    init(authData: FIRUser) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
