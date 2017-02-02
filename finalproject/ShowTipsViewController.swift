//
//  ShowTipsViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 25-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ShowTipsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Variables.
    var currentCity = String()
    
    let tipRef = FIRDatabase.database().reference(withPath: "tip-items")
    var tipItems: [Tip] = []
    
    // MARK: - Outlets
    @IBOutlet weak var tipsTableView: UITableView!

    // MARK: - viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()

        tipRef.observe(.value, with: { snapshot in
            var newTips: [Tip] = []
            
            for tip in snapshot.children {
                let newTip = Tip(snapshot: tip as! FIRDataSnapshot)
                
                if newTip.city == self.currentCity {
                    newTips.append(newTip)
                }
            }
    
            self.tipItems = newTips
            self.tipsTableView.reloadData()
        })
    }
    
    // MARK: - Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath) as! UserTipsCell
        
        let item = tipItems[indexPath.row]
        cell.tipTitleLabel.text = item.type
        cell.tipDescriptionLabel.text = item.description
        cell.tipNameLabel.text = item.name
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
