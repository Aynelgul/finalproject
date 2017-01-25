//
//  ShowBuddiesViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 25-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import Firebase

class ShowBuddiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Variables.
    var travelItems: [Travel] = []
    var allTravelers: [String] = []
    var travelBuddies: [String] = []
    
    // MARK: Outlets.
    @IBOutlet weak var buddiesTableView: UITableView!

    // MARK: Actions.
    @IBAction func inviteButtonDidTouch(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for traveler in allTravelers {
            if traveler != (FIRAuth.auth()?.currentUser?.uid)! {
                travelBuddies.append(traveler)
            }
        }
            self.buddiesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelBuddies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buddyCell", for: indexPath) as! UserBuddiesCell

        let item = travelBuddies[indexPath.row]
        cell.buddyEmailLabel.text = item

        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
