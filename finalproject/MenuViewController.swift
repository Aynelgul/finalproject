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

    // MARK: Actions
    @IBAction func logoutButtonDidTouch(_ sender: UIBarButtonItem) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        FIRAuth.auth()!.addStateDidChangeListener { auth, user in
//            guard let user = user else { return }
//            self.user = User(authData: user)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
