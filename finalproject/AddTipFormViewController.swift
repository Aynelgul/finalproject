//
//  AddTipFormViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 18-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import Firebase

class AddTipFormViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: Variables.
    let TipsRef = FIRDatabase.database().reference(withPath: "tip-items")
    var pickerOptions = ["Restaurant", "Hotel", "Park", "Museum", "Shop", "Festival", "Club", "Cafe", "Other"]
//    var chosenOption: String = ""
    
    // MARK: Outlets
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set borders TextField.
        let myColor : UIColor = UIColor.darkGray
        descriptionTextField.layer.borderColor = myColor.cgColor
        descriptionTextField.layer.borderWidth = 1.0
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
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
