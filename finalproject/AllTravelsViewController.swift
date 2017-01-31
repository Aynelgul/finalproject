//
//  AllTravelsViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 16-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AllTravelsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Variables.
    let travelRef = FIRDatabase.database().reference(withPath: "travel-items")
    var travelItems: [Travel] = []
    var startDateForSegue = NSDate()
    var endDateForSegue = NSDate()
    
    // MARK: Outlets.
    @IBOutlet weak var travelsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelRef.observe(.value, with: { snapshot in
            var newItems: [Travel] = []
            
            for item in snapshot.children {
                let travelItem = Travel(snapshot: item as! FIRDataSnapshot)
                
                for user in travelItem.uids {
                    if user == (FIRAuth.auth()?.currentUser?.uid)! {
                        newItems.append(travelItem)
                    }
                }
            }
            
            self.travelItems = newItems
            self.travelsTableView.reloadData()
        })
    }
    
    // MARK: viewDidLoad.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        travelsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! UserTravelsCell
        
        let item = travelItems[indexPath.row]
        
        // Convert Double to NSDate
        self.startDateForSegue = NSDate(timeIntervalSince1970: item.startDate)
        self.endDateForSegue = NSDate(timeIntervalSince1970: item.endDate)

        let startDateString = convertNSDateToString(date: self.startDateForSegue as Date)
        
        cell.countryLabel.text = item.country
        cell.cityLabel.text = item.city
        cell.dateLabel.text = startDateString
        
        return cell
    }
    
    // MARK: Functions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToSpecifics", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            
            let uiAlert = UIAlertController(title: "Delete Travel", message: "Are you sure you want to delete this travel? It will be removed from all your potential buddies their travels as wel.", preferredStyle: UIAlertControllerStyle.alert)
            
            uiAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                //remove from data source
                let travelItem = self.travelItems[indexPath.row]
                travelItem.ref?.removeValue()
                
            }))
            
            uiAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(uiAlert, animated: true, completion: nil)

        }
    }
    
    func convertNSDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSpecifics" {
            let destination = segue.destination as? SpecificTravelViewController
            
            destination?.startDateReceiver = self.startDateForSegue
            destination?.endDateReceiver = self.endDateForSegue
            
            let indexPath = travelsTableView.indexPathForSelectedRow
            destination?.selectedTravelItem = self.travelItems[(indexPath?.row)!]
            print(self.travelItems[(indexPath?.row)!])

            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
