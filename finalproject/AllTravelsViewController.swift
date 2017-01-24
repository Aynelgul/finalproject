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
    
    var countrySegueName = String()
    var citySegueName = String()
    
    // MARK: Outlets.
    @IBOutlet weak var travelsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelsTableView.dataSource = self
        
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
        cell.countryLabel.text = item.country
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SHOULD PERFORM SEGUE; DIDSELECTROW FUNC")
        
        let countryName = travelItems[indexPath.row].country
        let cityName = travelItems[indexPath.row].city
        self.countrySegueName = countryName
        self.citySegueName = cityName

        performSegue(withIdentifier: "goToSpecifics", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let travelItem = items[indexPath.row]
//            travelItem.ref?.removeValue()
//            
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSpecifics" {
            
            print("REACHES SEGUE, PREPARE")
            
            let destination = segue.destination as? ShowInfoViewController
            
            destination?.countryReceiver = self.countrySegueName
            destination?.cityRecheiver = self.citySegueName
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
