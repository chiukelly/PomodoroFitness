//
//  LoginViewController.swift
//  stepcity
//
//  Created by Kelly Chiu on 10/24/20.
//  Copyright © 2020 convergent health bt. All rights reserved.
//

import UIKit
import FirebaseAuth
import HealthKit

class LoginViewController: UIViewController {

    @IBOutlet weak var title1Text: UILabel!
    
    @IBOutlet weak var title2Text: UILabel!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var signinButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var val = 0
    let healthStore = HKHealthStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // authorizeHealthKit()

        // Do any additional setup after loading the view.
        setUpElements()
        
    }
    
    func authorizeHealthKit() {
        let read = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
        let share = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
        healthStore.requestAuthorization(toShare: share, read: read) { (chk, error) in
        if(chk) {
            print("permission granted")
            //self.getTodayTotalStepCounts()
            }
        }
    }

    func setUpElements() {
        // Hide error label
        errorLabel.alpha = 0
        title1Text.font = UIFont(name: "PixelOperatorMono-Bold", size:70)
        title2Text.font = UIFont(name: "PixelOperatorMono-Bold", size:70)

        //Roboto-Light
    }
    
    // Check the fields and validate that the data is correct
    func validateFields() -> String? {
        // Check that all fields are filled in
        if emailText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||   passwordText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        return nil
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
        let error = validateFields()
        
        if error != nil {
            // Something wrong with the fields, show error message
            showError(error!)
        }
        else {
            // Create cleaned versions of the text fields
            let email = emailText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordText.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            
                if error != nil {
                    // Couldn't sign in
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                }
                else {
                    for family: String in UIFont.familyNames
                    {
                        print(family)
                        for names: String in UIFont.fontNames(forFamilyName: family)
                        {
                            print("== \(names)")
                        }
                    }
                    self.performSegue(withIdentifier: "loginSegueIdentifier", sender: nil)

//                    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
//
//                    self.view.window?.rootViewController = homeViewController
//                    self.view.window?.makeKeyAndVisible()
                }
            }
        }
    }
    

}
