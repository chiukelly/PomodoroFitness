//
//  SignUpViewController.swift
//  stepcity
//
//  Created by Kelly Chiu on 10/24/20.
//  Copyright © 2020 convergent health bt. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var createAccountText: UILabel!
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        // Hide error label
        errorLabel.alpha = 0
        
        // Style the elements
        createAccountText.font = UIFont(name: "PixelOperatorMono-Bold", size:30)

    }
    
    func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    // Check the fields and validate that the data is correct
    func validateFields() -> String? {
        // Check that all fields are filled in
        if emailText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || nameText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || usernameText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill in all fields"
        }
        
        // Check if the password is sercure
        let cleanedPassword = passwordText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number"
        }
        return nil
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            // Something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Cleaned version of the data
            let email = emailText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let name = nameText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let username = usernameText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
             let password = passwordText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                // Check for errors
                if err != nil {
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    // User was created successfully, now store
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["name": name, "username": username, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                        
                    }
                    // Transition to the home screen
                    self.transitionToHome()
                }
            }
        }
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        self.performSegue(withIdentifier: "signupSegueIdentifier", sender: nil)

//       let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
//
//        view.window?.rootViewController = homeViewController
//        view.window?.makeKeyAndVisible()
    }
}
