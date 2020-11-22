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
    @IBOutlet weak var stepsText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // design for steps
        goalStepsText.layer.cornerRadius = 10.0
        goalStepsText.clipsToBounds = true
        stepsText.font = UIFont(name: "Roboto-Light", size:15)

        // design for edit building button
        editBuildingButton.backgroundColor = UIColor(red: 95.0/255, green: 108.0/255, blue: 227.0/255, alpha: 1.0)
        editBuildingButton.layer.cornerRadius = 15
        editBuildingButton.layer.borderWidth = 1
        editBuildingButton.layer.borderColor = UIColor.lightGray.cgColor
        editBuildingButton.titleLabel?.font = UIFont(name: "Roboto-Light", size:15)
        
        // design for start stepping building
        startSteppingButton.backgroundColor = UIColor(red: 43.0/255, green: 58.0/255, blue: 215.0/255, alpha: 1.0)
        startSteppingButton.layer.cornerRadius = 15
        startSteppingButton.layer.borderWidth = 1
        startSteppingButton.layer.borderColor = UIColor.lightGray.cgColor
        startSteppingButton.titleLabel?.font = UIFont(name: "Roboto-Light", size:15)
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
