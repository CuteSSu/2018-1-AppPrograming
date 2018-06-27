//
//  SegControlViewController.swift
//  Week05
//
//  Created by SWUCOMPUTER on 2018. 4. 25..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class SegControlViewController: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var leftRight: UISegmentedControl!
    var selected:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if selected == 0{
            
            infoLabel.text = "왼쪽 선택됨"
        }
        else{
             infoLabel.text = "오른쪽 선택됨"
        }
    }

    
}
