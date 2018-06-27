//
//  ViewController.swift
//  Week05
//
//  Created by SWUCOMPUTER on 2018. 4. 25..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var switchOnOff: UISwitch!
    @IBOutlet var leftRight: UISegmentedControl!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSwitchView"{
             let destVC = segue.destination as! SwitchViewController
            
            if switchOnOff.isOn{
                destVC.onOffStatus = true
            }
            else{
                destVC.onOffStatus = false
            }
        }
        else if segue.identifier == "toSegControlView"{
            let destVC = segue.destination as! SegControlViewController
            
            let label: String! = leftRight.titleForSegment(at: leftRight.selectedSegmentIndex)
            
            if label == "왼쪽"
            {
                destVC.selected = 0
            }
            else{
                destVC.selected = 1
            }
        }

        
        
    }
    

}

