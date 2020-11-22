//
//  StepsViewController.swift
//  stepcity
//
//  Created by Kelly Chiu on 11/11/20.
//  Copyright © 2020 convergent health bt. All rights reserved.
//

import UIKit

class StepsViewController: UIViewController {

    @IBOutlet weak var editBuildingButton: UIButton!
    @IBOutlet weak var startSteppingButton: UIButton!
    
    var count = 100
   
    @IBOutlet weak var goalStepsText: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalStepsText.layer.cornerRadius = 10.0
        goalStepsText.clipsToBounds = true
        
        editBuildingButton.backgroundColor = UIColor(red: 95.0, green: 108.0, blue: 227.0, alpha: 1.0)
        editBuildingButton.layer.cornerRadius = 30
        editBuildingButton.layer.borderWidth = 1
        editBuildingButton.layer.borderColor = UIColor.lightGray.cgColor
        
        startSteppingButton.backgroundColor = UIColor(red: 95.0, green: 108.0, blue: 227.0, alpha: 1.0)
        startSteppingButton.layer.cornerRadius = 30
        startSteppingButton.layer.borderWidth = 1
        startSteppingButton.layer.borderColor = UIColor.lightGray.cgColor
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
