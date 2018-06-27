//
//  SegmentViewController.swift
//  Week5
//
//  Created by SWUCOMPUTER on 2018. 4. 3..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class SegmentViewController: UIViewController {

    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var leftRightSegControl: UISegmentedControl!
    var info:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let contentString = info{
            infoLabel.text = contentString
        }
    }

   
}
