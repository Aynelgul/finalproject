//
//  AddTravelFormViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 18-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import Firebase

class AddTravelFormViewController: UIViewController {
    
    // MARK: Variables.
    let ref = FIRDatabase.database().reference(withPath: "travel-items")
    
    var chosenCountryTravel = String()
    var chosenCityTravel = String()
    var chosenCountryCodeTravel = String()
    
    // MARK: Outlets.
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: Actions
    @IBAction func OKButtonDidTouch(_ sender: UIButton) {
        
        let newTravel = Travel(country: self.chosenCountryTravel, city: self.chosenCityTravel, countryCode: chosenCountryCodeTravel, uids: [(FIRAuth.auth()?.currentUser?.uid)!, "buddy uid"])

        
        let travelRef = self.ref.child(newTravel.country)
        travelRef.setValue(newTravel.toAnyObject())

        self.performSegue(withIdentifier: "goToTravelList", sender: nil)
        
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Change text color of datePicker.
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.datePickerMode = .countDownTimer
        datePicker.datePickerMode = .dateAndTime //or whatever your original mode was
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
