//
//  ShowBuddiesViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 25-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import Firebase

typealias inviteBuddyComplete = (Bool, User?) -> Void

class ShowBuddiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Variables.
    var travelItems: [Travel] = []
    var allTravelers: [String] = []
    var travelBuddies: [String] = []
    var travelId = String()
    
    var travelRef = FIRDatabase.database().reference(withPath: "travel-items")
    var userRef = FIRDatabase.database().reference(withPath: "Users")
    
    // MARK: Outlets.
    @IBOutlet weak var buddiesTableView: UITableView!

    // MARK: Actions.
    @IBAction func inviteButtonDidTouch(_ sender: UIButton) {
        
        showAlertControllerWith { (succeed, user) in
            
            if succeed {
                
                if let user = user {
                    
                    print("gelukt!! UID buddy: \(user.uid)")
                    // TODO!
                    
                    
                    self.travelRef.observe(.value, with: { snapshot in
                        for item in snapshot.children {
                            var travelItem = Travel(snapshot: item as! FIRDataSnapshot)
                            
                            if travelItem.travelId == self.travelId {
//                                travelItem.uids.append(user.uid)
                            }
                        }
                    })
                }
                
            } else {
                
                print("Er is iets fout gegaan!")
                // geef alert
            }
            
        }
    }
    
    private func showAlertControllerWith(completion: @escaping inviteBuddyComplete) {
        
        let alertController = UIAlertController(title: "Add Travel Buddy", message: "", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Add", style: .default, handler: {
            alert -> Void in
            
            let textField = alertController.textFields![0] as UITextField
            
            self.userRef.observe(.value, with: { snapshot in
                for user in snapshot.children {
                    let userItem = User(snapshot: user as! FIRDataSnapshot)
                    
                    if textField.text! == userItem.email {
                        
                        // TODO: Gevonden!
                        // Stuur naar userItem naar iets
                        print("Gevonden: \(userItem.email)")
                        completion(true, userItem)
                        return
                    }
                }
                
                completion(false, nil)
            })
            
            
            // users ophalen en checken op email
            // als user bestaat; toevoegen
            // anders foutmelding
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Email"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
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
