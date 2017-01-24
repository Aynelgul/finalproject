//
//  AddTipFormViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 18-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class AddTipFormViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: Variables.
    let ref = FIRDatabase.database().reference(withPath: "tip-items")
    
    var pickerOptions = ["Restaurant", "Hotel", "Park", "Museum", "Shop", "Festival", "Club", "Cafe", "Other"]
    var chosenOption = String()
    var chosenCountry = String()
    var chosenCity = String()
    
    // MARK: Outlets.
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var pickerView: UIPickerView!

    // MARK: Actions.
    @IBAction func OKButtonDidTouch(_ sender: UIButton) {
        if descriptionTextField.text != "" {
            let newTip = Tip(uid: (FIRAuth.auth()?.currentUser?.uid)!, country: chosenCountry, city: chosenCity, type: chosenOption, description: descriptionTextField.text)
            let tipsRef = self.ref.child(newTip.type)
        tipsRef.setValue(newTip.toAnyObject())

            self.performSegue(withIdentifier: "goBackToMap", sender: nil)
        }
    }

    // MARK: Functions.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddTipFormViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        
        view.addGestureRecognizer(tap)
        
        // Set borders TextField.
        let myColor : UIColor = UIColor.lightGray
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.chosenOption = pickerOptions[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let str = pickerOptions[row]
        return NSAttributedString(string: str, attributes: [NSForegroundColorAttributeName:UIColor.white])
    }
    
    // Function when tap is recognized.
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
