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

    // MARK: - Variables.
    let ref = FIRDatabase.database().reference(withPath: "tip-items")
    
    var pickerOptions = ["Restaurant", "Hotel", "Park", "Museum", "Shop", "Festival", "Club", "Cafe", "Other"]
    var chosenOption = String()
    var chosenCountry = String()
    var chosenCity = String()
    
    // MARK: - Outlets.
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    // MARK: - viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddTipFormViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        
        view.addGestureRecognizer(tap)
        
        configuratePickerView()
        
    }

    // MARK: - Actions.
    @IBAction func OKButtonDidTouch(_ sender: UIButton) {
        if descriptionTextField.text == "" || nameTextfield.text == "" {
            let alert = UIAlertController(title: "Oops!", message: "Please fill in all fields.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let newTip = Tip(uid: (FIRAuth.auth()?.currentUser?.uid)!, country: chosenCountry, city: chosenCity, type: chosenOption, name: nameTextfield.text!, description: descriptionTextField.text!)
            
            let tipsRef = self.ref.childByAutoId()
            
            tipsRef.setValue(newTip.toAnyObject())
            
            presentAlert(title: "Done", message: "Your tip has been added. Thank you!")
        }
    }
    
    // MARK: - Functions.
    private func presentAlert(title: String, message: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func configuratePickerView() -> Void {
        pickerView.dataSource = self
        pickerView.delegate = self
        
        let defaultPickerRow = pickerOptions.count / 2
        pickerView.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        chosenOption = pickerOptions[defaultPickerRow]
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
    
    /// Function for when tap is recognized.
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
