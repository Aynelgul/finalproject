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
    
    // LET OP: COUNTRY EN CITY MOETEN OOK MEE NAAR FIREBASE
    
    // MARK: Variables.
    let TipsRef = FIRDatabase.database().reference(withPath: "user-items")
    
    // MARK: Outlets.
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: Actions
    @IBAction func OKButtonDidTouch(_ sender: UIButton) {
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.datePickerMode = .countDownTimer
        datePicker.datePickerMode = .dateAndTime //or whatever your original mode was
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
