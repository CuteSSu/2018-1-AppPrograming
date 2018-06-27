//
//  OrderViewController.swift
//  Week5
//
//  Created by SWUCOMPUTER on 2018. 4. 3..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet var onOffSwitch: UISwitch!
    @IBOutlet var infoLabel: UILabel!
    var onOffStatus: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if onOffStatus == true {
           infoLabel.text = "Swich is On"
        }
        else{
            infoLabel.text = "Swich is Off"
        }
    }
}
