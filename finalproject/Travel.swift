//
//  Travel.swift
//  finalproject
//
//  Created by Aynel Gül on 19-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import Foundation
import Firebase

struct Travel {
    
    // date moet nog aangepast worden!!
    let date: String
    let country: String
    let city: String
    let countryCode: String
    let uids: [String]
    
    let ref: FIRDatabaseReference?
    
    init(date: String = "", country: String, city: String, countryCode: String, uids: [String]) {
        
        self.date = date
        self.country = country
        self.city = city
        self.countryCode = countryCode
        self.uids = uids
        
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value! as! [String: AnyObject]
        
        date = snapshotValue["date"] as! String
        country = snapshotValue["country"] as! String
        city = snapshotValue["city"] as! String
        countryCode = snapshotValue["country code"] as! String
        uids = snapshotValue["uids"] as! [String]
        
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "date": date,
            "country": country,
            "city": city,
            "country code": countryCode,
            "uids": uids
        ]
    }
    
}
