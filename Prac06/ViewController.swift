//
//  ViewController.swift
//  Prac06
//
//  Created by SWUCOMPUTER on 2018. 4. 10..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet var labelinfo: UILabel!
    @IBOutlet var pickerCollege: UIPickerView!
    
    let yearArray: Array<String> = ["1학년", "2학년", "3학년", "4학년"]
    let deptArray: [String] = ["디지털미디어학과", "정보보호학과", "소프트웨어융합학과",
                               "컴퓨터학과", "콘텐츠디자인학과"]
    
    @IBAction func getDateTime() {
    
        let year: String = yearArray[self.pickerCollege.selectedRow(inComponent: 0)]
        let dept: String = deptArray[self.pickerCollege.selectedRow(inComponent: 1)]
        labelinfo.text = year + ", " + dept
      
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return yearArray.count }
        else {
            return deptArray.count }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return yearArray[row] }
        else {
            return deptArray[row] }
    }
    
}

