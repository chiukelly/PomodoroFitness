//
//  StepsViewController.swift
//  stepcity
//
//  Created by Kelly Chiu on 11/11/20.
//  Copyright © 2020 convergent health bt. All rights reserved.
//

import UIKit

class StepsViewController: UIViewController {

    var count = 100
   
    @IBOutlet weak var goalStepsText: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalStepsText.layer.cornerRadius = 10.0
        goalStepsText.clipsToBounds = true
    }
    
    @IBAction func increaseSteps(_ sender: Any) {
        count += 100
        goalStepsText.text = "\(count)" + " "
    }
    
    
    @IBAction func decreaseSteps(_ sender: Any) {
        count -= 100
        goalStepsText.text = "\(count)" + " "
    }
}
