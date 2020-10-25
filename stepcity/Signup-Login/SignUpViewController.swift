//
//  SignUpViewController.swift
//  stepcity
//
//  Created by Kelly Chiu on 10/24/20.
//  Copyright © 2020 convergent health bt. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

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
    }
    
    @IBAction func signupTapped(_ sender: Any) {
    }
    

}
