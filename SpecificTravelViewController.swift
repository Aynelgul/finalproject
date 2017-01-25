//
//  SpecificTravelViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 13-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit

class SpecificTravelViewController: UIViewController {
    
    // MARK: Variables.
    var countryReceiver = String()
    var cityRecheiver = String()
    var countryCodeRecheiver = String()
    var uidsReceiver: [String] = []
    
    // MARK: Outlets.
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    
    // Mark: Actions
    @IBAction func segmentSelectedAction(_ sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            firstView.isHidden = false
            secondView.isHidden = true
            thirdView.isHidden = true
        case 1:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = false
        case 2:
            firstView.isHidden = true
            secondView.isHidden = false
            thirdView.isHidden = true
        default:
            break;
        }
    }
    
    // Mark: Functions.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.isHidden = false
        secondView.isHidden = true
        thirdView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoInfoContainer" {
            
            let destination = segue.destination as? ShowInfoViewController
            
            destination?.countryReceiver = self.countryReceiver
            destination?.cityRecheiver = self.cityRecheiver
            destination?.countryCodeRecheiver = self.countryCodeRecheiver
        }
        
        if segue.identifier == "gotoTipsContainer" {
            let secondDestination = segue.destination as? ShowTipsViewController
            secondDestination?.currentCity = self.cityRecheiver
            
            print(self.cityRecheiver)
        }
        
        if segue.identifier == "gotoBuddiesContainer" {
            let thirdDestination = segue.destination as? ShowBuddiesViewController
            thirdDestination?.allTravelers = self.uidsReceiver
        }
    }
}
