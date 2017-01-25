//
//  Tip.swift
//  finalproject
//
//  Created by Aynel Gül on 18-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import Foundation
import Firebase

struct Tip {
    
    let uid: String
    let country: String
    let city: String
    let type: String
    let name: String
    let description: String
    
    let ref: FIRDatabaseReference?
    
    init(uid: String, country: String, city: String, type: String, name: String, description: String) {

        self.uid = uid
        self.country = country
        self.city = city
        self.type = type
        self.name = name
        self.description = description

        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value! as! [String: AnyObject]
        uid = snapshotValue["uid"] as! String
        country = snapshotValue["country"] as! String
        city = snapshotValue["city"] as! String
        type = snapshotValue["type"] as! String
        name = snapshotValue["name"] as! String
        description = snapshotValue["description"] as! String

        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "uid": uid,
            "country": country,
            "city": city,
            "type": type,
            "name": name,
            "description": description
        ]
    }
    
}
