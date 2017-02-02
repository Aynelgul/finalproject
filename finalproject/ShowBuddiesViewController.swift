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
    
    // MARK: - Variables.
    var travelItems: [Travel] = []
    var allTravelers: [String] = []
    var travelBuddies: [String] = []
    var travelId = String()
    var newTravelUids: [String] = []
    
    var travelRef = FIRDatabase.database().reference(withPath: "travel-items")
    var userRef = FIRDatabase.database().reference(withPath: "Users")
    
    // MARK: - Outlets.
    @IBOutlet weak var buddiesTableView: UITableView!
    
    // MARK: - viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAllTravelers()
        
        self.buddiesTableView.reloadData()
    }

    // MARK: - Actions.
    @IBAction func inviteButtonDidTouch(_ sender: UIButton) {
        
        showAlertControllerWith { (succeed, user) in
            if succeed {
                if let user = user {
                    self.travelRef.observeSingleEvent(of: .value, with: { snapshot in
                        for item in snapshot.children {
                            
                            let travelItem = Travel(snapshot: item as! FIRDataSnapshot)
                            
                            if travelItem.travelId == self.travelId {
                                self.newTravelUids = travelItem.uids
                                self.newTravelUids.append(user.uid)
                                self.travelRef.child((item as! FIRDataSnapshot).key).updateChildValues(["uids": self.newTravelUids])
                                
                                self.updateAllTravelers()
                                self.buddiesTableView.reloadData()
                            }
                        }
                    })
                }
                
            }
            else {
                self.presentAlert(title: "Oops!", message: "Your buddy does not use Adventure Time yet.")
            }
        }
    }
    
    // MARK: - Functions.
    private func showAlertControllerWith(completion: @escaping inviteBuddyComplete) {
        
        let alertController = UIAlertController(title: "Add Travel Buddy", message: "", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Add", style: .default, handler: {
            alert -> Void in
            
            let textField = alertController.textFields![0] as UITextField
            
            self.userRef.observe(.value, with: { snapshot in
                for user in snapshot.children {
                    let userItem = User(snapshot: user as! FIRDataSnapshot)
                    
                    if textField.text! == userItem.email {
                        // Buddy is found in user database.
                        print("Gevonden: \(userItem.email)")
                        completion(true, userItem)
                        return
                    }
                }
                // Buddy is not a known Aventure Time user.
                completion(false, nil)
            })
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelBuddies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buddyCell", for: indexPath) as! UserBuddiesCell

        let item = travelBuddies[indexPath.row]
        cell.buddyEmailLabel.text = item

        return cell
    }
    
    func updateAllTravelers() -> Void {
        for traveler in allTravelers {
            if traveler != (FIRAuth.auth()?.currentUser?.uid)! {
                travelBuddies.append(traveler)
            }
        }
    }
    
    func presentAlert(title: String, message: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
