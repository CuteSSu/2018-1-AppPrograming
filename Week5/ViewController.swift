//
//  ViewController.swift
//  Week5
//
//  Created by SWUCOMPUTER on 2018. 4. 3..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var leftRightSegControl: UISegmentedControl!
    @IBOutlet var onOffSwich: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSwitchView" {
            let destVC = segue.destination as! OrderViewController
            
            if onOffSwich.isOn {
               destVC.onOffStatus = true
            }
            else{
                destVC.onOffStatus = false
            }
           }
            
        else if segue.identifier == "toSegmentView"{
            let destVC = segue.destination as! SegmentViewController
            
            let labeel: String! = leftRightSegControl.titleForSegment(at: leftRightSegControl.selectedSegmentIndex)
            
            var outString:String = labeel
            outString += " 선택됨"
            destVC.info = outString
            
        }
    }
}

