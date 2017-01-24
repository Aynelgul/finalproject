//
//  SpecificTravelViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 13-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit

class SpecificTravelViewController: UIViewController {
    
    // MARK: Outlets.
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    
    // Mark: Actions
    @IBAction func segmentSelectedAction(_ sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            firstView.isHidden = false
            secondView.isHidden = true
//            pickLabel.text = "Please select a date"
        case 1:
            firstView.isHidden = true
            secondView.isHidden = false
//            pickLabel.text = "What kind of tip is it?"
        case 2:
            firstView.isHidden = true
            secondView.isHidden = false
        default:
            break;
        }
    }
    
    // Mark: Functions.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
