//
//  ViewController.swift
//  stepcity
//
//  Created by Kelly Chiu on 10/17/20.
//  Copyright © 2020 convergent health bt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }
}

