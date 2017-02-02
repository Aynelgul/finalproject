//
//  MenuViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 16-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MenuViewController: UIViewController {
    
    // MARK: - viewDidLoad.
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction func logoutButtonDidTouch(_ sender: UIBarButtonItem) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
            presentAlert(title: "Oops!", message: "Sign out failed. Please try again.")
        }
    }
    
    // MARK: - Functions.
    private func presentAlert(title: String, message: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
