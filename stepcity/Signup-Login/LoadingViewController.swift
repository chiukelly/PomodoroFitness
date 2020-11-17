//
//  LoadingViewController.swift
//  stepcity
//
//  Created by Kelly Chiu on 10/26/20.
//  Copyright © 2020 convergent health bt. All rights reserved.
//

import UIKit

// for the loading screen while firebase is loading
class LoadingViewController: UIViewController {
    
    @IBOutlet weak var loadingText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingText.frame = CGRect(x: 0, y: 0, width: 233, height: 47)

        view.backgroundColor = .white


        loadingText.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)

        loadingText.font = UIFont(name: "PixelOperatorMono-Bold", size: 20)


        // Line height: 21 pt


        loadingText.textAlignment = .center

        loadingText.text = "LOADING..."


        //let parent = self.loadingText!

//        parent.addSubview(loadingText)
//
//        loadingText.translatesAutoresizingMaskIntoConstraints = false
//
//        loadingText.widthAnchor.constraint(equalToConstant: 233).isActive = true
//
//        loadingText.heightAnchor.constraint(equalToConstant: 47).isActive = true
//
//        loadingText.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 81).isActive = true
//
//        loadingText.topAnchor.constraint(equalTo: parent.topAnchor, constant: 320).isActive = true

    }


}
