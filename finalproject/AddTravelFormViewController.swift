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
    
    var interval = Double()
    var travelDate = NSDate()
    
    // MARK: Outlets.
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change text color of datePicker.
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.datePickerMode = .countDownTimer
        datePicker.datePickerMode = .dateAndTime //or whatever your original mode was
    }
    
    // MARK: Actions
    @IBAction func OKButtonDidTouch(_ sender: UIButton) {
        
        travelDate = datePicker.date as NSDate
        interval = travelDate.timeIntervalSince1970
        
        let curDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.S"
        let dateString = dateFormatter.string(from: curDate as Date)
        
        print(dateString)
        
        let newTravel = Travel(date: interval, country: self.chosenCountryTravel, city: self.chosenCityTravel, countryCode: chosenCountryCodeTravel, uids: [(FIRAuth.auth()?.currentUser?.uid)!], travelId: dateString)
        
        let travelRef = self.ref.childByAutoId()
        travelRef.setValue(newTravel.toAnyObject())
        
//        self.performSegue(withIdentifier: "goToTravelList", sender: nil)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
