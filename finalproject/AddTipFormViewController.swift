//
//  AddTipFormViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 18-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit

class AddTipFormViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: Actions

    override func viewDidLoad() {
        super.viewDidLoad()

        let myColor : UIColor = UIColor.darkGray
        descriptionTextField.layer.borderColor = myColor.cgColor
        
        descriptionTextField.layer.borderWidth = 1.0
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
