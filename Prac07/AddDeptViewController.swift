//
//  AddDeptViewController.swift
//  Prac07
//
//  Created by SWUCOMPUTER on 2018. 5. 1..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class AddDeptViewController: UIViewController {

    @IBOutlet var textAddedDept: UITextField!
    var deptVC: UITableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addDepartment() {
        if let targetVC = deptVC as? DeptTableViewController {
            targetVC.addedDept = self.textAddedDept.text
            // 현재의 입력 View를 코드를 통해 pop up 시킴
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
