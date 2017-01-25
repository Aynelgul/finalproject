//
//  FormViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 18-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FormViewController: UIViewController {
    
    // MARK: Variables.
    var receivedCountry = String()
    var receivedCity = String()
    var reveivedCountryCode = String()
    
    // MARK: Outlets
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var pickLabel: UILabel!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    

    // MARK: Actions
    @IBAction func OKButtonDidTouch(_ sender: UIButton) {
        
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: UIButton) {
        
    }
    
    @IBAction func segmentSelectedAction(_ sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            firstView.isHidden = false
            secondView.isHidden = true
            pickLabel.text = "Select the date"
        case 1:
            firstView.isHidden = true
            secondView.isHidden = false
            pickLabel.text = "What kind of tip is it?"
        default:
            break; 
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddTipFormViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        
        view.addGestureRecognizer(tap)
        
        firstView.isHidden = false
        secondView.isHidden = true
        pickLabel.text = "Please select a date"

//        self.cityLabel.text = self.receivedCity
//        self.countryLabel.text = self.receivedCountry
        
        cityLabel?.text = self.receivedCity
        countryLabel?.text = self.self.receivedCountry
    }
    
    // Function when tap is recognized.
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAddTip" {
            let destination = segue.destination as? AddTipFormViewController
            
            destination?.chosenCountry = self.receivedCountry
            destination?.chosenCity = self.receivedCity
            
        }
        
        if segue.identifier == "goToAddTravel" {
            let destination = segue.destination as? AddTravelFormViewController
            
            destination?.chosenCountryTravel = self.receivedCountry
            destination?.chosenCityTravel = self.receivedCity
            destination?.chosenCountryCodeTravel = self.reveivedCountryCode
        }
    }

}
