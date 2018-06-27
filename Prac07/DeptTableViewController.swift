//
//  DeptTableViewController.swift
//  Prac07
//
//  Created by SWUCOMPUTER on 2018. 5. 1..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class DeptTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    // MARK: - Table view data source
    var departmentList: [String]! //자료가 상위 뷰에서 하위 뷰로 전달되어야한다.
// 하위 View에서 입력한 학과명을 넘겨받을 변수
    var addedDept: String?
    
    override func viewWillAppear (_ animated: Bool) { super.viewWillAppear(animated)
        if let deptName = self.addedDept {
            departmentList.append(deptName)
            // tableView에 복수개를 추가할 수도 있으므로
            // 배열 형태로 IndexPath 정보를 담고 있음
            self.tableView.insertRows (at: [IndexPath (row: self.departmentList.count-1, section: 0)], with: .automatic)
            self.addedDept = nil
            
        }
    }
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // 섹션은 1개
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return departmentList.count //row는 학과로 개수를 정할거
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Department Cell", for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = departmentList[indexPath.row] //학과 내용자료를 넣어줄거
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            departmentList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toAddDeptView" {
            if let destVC = segue.destination as? AddDeptViewController {
                destVC.title = "추가할 학과입력"
                destVC.deptVC = self
            } }
    }
 

}
