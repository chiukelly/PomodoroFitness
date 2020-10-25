//
//  LoginViewController.swift
//  stepcity
//
//  Created by Kelly Chiu on 10/24/20.
//  Copyright © 2020 convergent health bt. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var signinButton: UIButton!
    
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
    @IBAction func loginTapped(_ sender: Any) {
    }
    

}
