//
//  ViewController.swift
//  CustomAlertViewAS
//
//  Created by Ashwini on 11/02/20.
//  Copyright © 2020 Ashwini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSuccessAlertTapped(_ sender: Any) {
        //when want to show success alert select alertType as .success
        AlertView.shared.showAlert(title: "Success", message: "Succesfully showed Success custom alert", alertType: .success)
        //add completion handler on click of done button
        AlertView.shared.onComplete = { Result in
            print(Result)
            // you can navigate to another ViewController on click on done button
            // just write navigation code here
        
        }
    }
    
    @IBAction func btnFailedAlertTapped(_ sender: Any) {
        //when want to show success alert select alertType as .failure
        AlertView.shared.showAlert(title: "Failed", message: "Succesfully  showed Failed custom alert", alertType: .failure)
              //add completion handler on click of done button
              AlertView.shared.onComplete = { Result in
                  print(Result)
                  // you can navigate to another ViewController on click on done button
                  // just write navigation code here
              }
              
    }
}

