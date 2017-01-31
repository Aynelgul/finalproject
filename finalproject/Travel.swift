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
    let startDate: Double
    let endDate: Double
    let country: String
    let city: String
    let countryCode: String
    var uids: [String]
    let travelId: String
    
    let ref: FIRDatabaseReference?
    
    init(startDate: Double, endDate: Double, country: String, city: String, countryCode: String, uids: [String], travelId: String) {
        
        self.startDate = startDate
        self.endDate = endDate
        self.country = country
        self.city = city
        self.countryCode = countryCode
        self.uids = uids
        self.travelId = travelId
    
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value! as! [String: AnyObject]
        
        startDate = snapshotValue["startDate"] as! Double
        endDate = snapshotValue["endDate"] as! Double
        country = snapshotValue["country"] as! String
        city = snapshotValue["city"] as! String
        countryCode = snapshotValue["country code"] as! String
        uids = snapshotValue["uids"] as! [String]
        travelId = snapshotValue["travelId"] as! String
        
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "startDate": startDate,
            "endDate": endDate,
            "country": country,
            "city": city,
            "country code": countryCode,
            "uids": uids,
            "travelId" : travelId
        ]
    }
    
}
