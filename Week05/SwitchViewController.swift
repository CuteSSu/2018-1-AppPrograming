//
//  SwitchViewController.swift
//  Week05
//
//  Created by SWUCOMPUTER on 2018. 4. 25..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var `switch`: UISwitch!
    var onOffStatus: Bool!
    var info:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if onOffStatus == true{
            infoLabel.text = "Switch ON"
        }
        else {
             infoLabel.text = "Switch OFF"
        }
    }

   

}
