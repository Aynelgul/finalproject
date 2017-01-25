//
//  LoginViewController.swift
//  finalproject
//
//  Created by Aynel Gül on 16-01-17.
//  Copyright © 2017 Aynel Gül. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginViewController: UIViewController {
    
    // MARK: Variables
    
    // MARK: Outlets. 
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: Actions.
    @IBAction func loginButtonDidTouch(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return
        }
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                
                let alert = UIAlertController(title: "Oops!", message: "That e-mailadress and/or password is not correct! Try again or sign up.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                return
            }
            self.signedIn(user!)
            print("REF TEST")

            
        }
    }
    
    @IBAction func signupButtonDidTouch(_ sender: UIButton) {
        let alert = UIAlertController(title: "Sign Up",
                                      message: "Sign Up",
                                      preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { action in
                                        // Get email and password supplied by user from alert.
                                        let emailField = alert.textFields![0]
                                        let passwordField = alert.textFields![1]
                                        
                                        FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                                            if let error = error {
                                                print(error.localizedDescription)
                                                
                                                // Check if e-mail is not used already
                                                if error.localizedDescription == "The email address is already in use by another account." {
                                                    let alert = UIAlertController(title: "Oops!", message: "The email address is already in use by another account.", preferredStyle: UIAlertControllerStyle.alert)
                                                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                                                    self.present(alert, animated: true, completion: nil)
                                                }
                                                
                                                // Check if password is long enough.
                                                if error.localizedDescription == "The password must be 6 characters long or more." {
                                                    let alert = UIAlertController(title: "Oops!", message: "The password must be 6 characters long or more.", preferredStyle: UIAlertControllerStyle.alert)
                                                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                                                    self.present(alert, animated: true, completion: nil)
                                                }
                                                
                                                // Check if all fields are filled in.
                                                let alert = UIAlertController(title: "Oops!", message: "Sign up failed. Please fill in all fields or check your e-mailadress.", preferredStyle: UIAlertControllerStyle.alert)
                                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                                                self.present(alert, animated: true, completion: nil)
                                                
                                                return
                                            }
                                            let ref = FIRDatabase.database().reference(withPath: "Users")
                                            let newUser = User(uid: (user?.uid)!, email: emailField.text!)
                                            let userRef = ref.child((user?.uid)!)
                                            userRef.setValue(newUser.toAnyObject())
                                        }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        
        if let user = FIRAuth.auth()?.currentUser {
            self.signedIn(user)
        }
        
        // Listener for state change of user.
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                self.performSegue(withIdentifier: "gotoMenu", sender: nil)
            }
        }
    }
    
    // MARK: Functions.
    func setDisplayName(_ user: FIRUser) {
        let changeRequest = user.profileChangeRequest()
        changeRequest.displayName = user.email!.components(separatedBy: "@")[0]
        changeRequest.commitChanges(){ (error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.signedIn(FIRAuth.auth()?.currentUser)
        }
    }
    
    func signedIn(_ user: FIRUser?) {
        emailTextField.text = ""
        passwordTextField.text = ""
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
