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
    
    // MARK: - Variables.
    let ref = FIRDatabase.database().reference(withPath: "travel-items")
    var chosenCountryTravel = String()
    var chosenCityTravel = String()
    var chosenCountryCodeTravel = String()
    
    // MARK: - Outlets.
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    // MARK: - viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change text color of datePickers.
        startDatePicker.setValue(UIColor.white, forKeyPath: "textColor")
        startDatePicker.datePickerMode = .countDownTimer
        startDatePicker.datePickerMode = .dateAndTime //or whatever your original mode was
        
        endDatePicker.setValue(UIColor.white, forKey: "textColor")
        endDatePicker.datePickerMode = .countDownTimer
        endDatePicker.datePickerMode = .dateAndTime
        
    }
    
    // MARK: - Actions.
    @IBAction func OKButtonDidTouch(_ sender: UIButton) {
        
        let startDate = startDatePicker.date as NSDate
        let endDate = endDatePicker.date as NSDate
        let intervalStartDate = startDate.timeIntervalSince1970
        let intervalEndDate = endDate.timeIntervalSince1970
        
        let curDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.S"
        let dateString = dateFormatter.string(from: curDate as Date)
        
        let newTravel = Travel(startDate: intervalStartDate, endDate: intervalEndDate, country: self.chosenCountryTravel, city: self.chosenCityTravel, countryCode: chosenCountryCodeTravel, uids: [(FIRAuth.auth()?.currentUser?.uid)!], travelId: dateString)
        
        let travelRef = self.ref.childByAutoId()
        travelRef.setValue(newTravel.toAnyObject())
        
//        self.performSegue(withIdentifier: "goToTravelList", sender: nil)
        
    }
    
    // MARK: - Functions.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
