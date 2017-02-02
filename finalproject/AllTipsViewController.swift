//
//  AllTipsViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 30-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import Firebase

class AllTipsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Outlets.
    @IBOutlet weak var myTipsTableView: UITableView!
    
    // MARK: Variables.
    var tipRef = FIRDatabase.database().reference(withPath: "tip-items")
    var tipItems: [Tip] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipRef.observe(.value, with: { snapshot in
            var newItems: [Tip] = []
            
            for item in snapshot.children {
                let tipItem = Tip(snapshot: item as! FIRDataSnapshot)
                
                if tipItem.uid == (FIRAuth.auth()?.currentUser?.uid)! {
                    newItems.append(tipItem)
                }
            }
            
            self.tipItems = newItems
            self.myTipsTableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTipsCell", for: indexPath) as! OwnTipsCell
        
        let item = tipItems[indexPath.row]
        
        cell.typeLabel.text = item.type
        cell.descriptionLabel.text = item.description
        cell.countryLabel.text = item.country
        cell.cityLabel.text = item.city
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let tipItem = self.tipItems[indexPath.row]
            tipItem.ref?.removeValue()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
