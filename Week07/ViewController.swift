//
//  ViewController.swift
//  Week07
//
//  Created by SWUCOMPUTER on 2018. 4. 10..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

 
    @IBOutlet var buttonNewYear: UIButton!
    @IBOutlet var buttonMemorial: UIButton!
    @IBOutlet var buttonIndependence: UIButton!
    @IBOutlet var buttonChristmas: UIButton!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var viewHidden: UIView!
    
    let yearMonthArray: Array<String> = ["1월 1일", "6월 6일", "8월 15일", "12월 25일"]
    var started:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        started = false
        viewHidden.isHidden = true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yearMonthArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return yearMonthArray[row]
    }
    
    @IBAction func buttonStart(_ sender: UIButton) {
        started = true
        if started == true{
            self.activityIndicator.startAnimating()
            self.viewHidden.isHidden = true
        }
    }
    
    @IBAction func buttonHoliday(_ sender: UIButton) {
       let index = pickerView.selectedRow(inComponent: 0)
        if started == true{
             if index == 0 && sender.titleLabel?.text == "설 날" ||
                index == 1 && sender.titleLabel?.text == "현충일" ||
                index == 2 && sender.titleLabel?.text == "광복절" ||
                index == 3 && sender.titleLabel?.text == "성탄절" {
                self.activityIndicator.stopAnimating()
                self.viewHidden.isHidden = false
                
                started = false
            }
            else {
                self.viewHidden.isHidden = true
            }
        }
        else {
            self.activityIndicator.stopAnimating()
        }
    }
}

