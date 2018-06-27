//
//  CollegaViewController.swift
//  Prac07
//
//  Created by SWUCOMPUTER on 2018. 5. 1..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class CollegaViewController: UITableViewController {
    
    var university:[String: [String]] =
        ["미래산업융합대학": ["디지털미디어학과", "소프트웨어융합학과", "정보보호학과","패션디자인학과", "산업디자인학과"],
         "사회과학대학": [ "경영학과", "경제학과", "문헌정보학과", "사회복지학과", "아동학과","행정학과", "언론영상학부" , "교육심리학과", "체육학과" ]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "서울여자대학교"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return university.count //카운트 값이(2개- 미래산업, 서회)가 row값이 되는 것이다.
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "College Cell", for: indexPath)

        var collegeName = Array(university.keys) // collegeName의 타입은 array(같은 항목의 타입이 여러개 있다)이다. 유니벌시티 딕셔너리의 키값만 모은다. -> university.keys  -> 키값만 뽑아서 하나의 어레이를 만든다. 따라서 2개의 값이 있다. -> 미래산업융합대학, 사회과학대학
        cell.textLabel?.text = collegeName[indexPath.row] //컬리지네임의 인텍스 값이 0인 항목 = 미래산업융합학고 가 텍스트 레이블에 써진다. -> row값이 2개이기 때문에 첫번째 칸은 0인 미래산업융합학과가 채워지고 두번째 칸은 1인 사회과학대학을 채운다.

        return cell
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController. // Pass the selected object to the new view controller.
        if segue.identifier == "toDeptView" {
            if let destination = segue.destination as? DeptTableViewController {
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row //indexPathsForSelectedRows는 사용자가 샐을 여저래중에 가장 첫번째거first중에 row값
                {
                    destination.title = Array(university.keys) [selectedIndex]
                    destination.departmentList = Array(university.values) [selectedIndex] } //상위뷰서 하위 뷰를 접근해서 전달하는 방법
            } }
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
            let collegeName = Array(university.keys) [indexPath.row]// [indexPath.row] 사용자가 지우고싶은 해당 셀
            self.university.removeValue(forKey: collegeName) //방금 지워야하는 그 셀의 학과 이름 -> 실제 어레이에서 사라지게 하는거 
            
            tableView.deleteRows(at: [indexPath], with: .fade) //셀의 내용을 그냥 딜리트하는 것  [indexPath 이건 동시에 여러개를 지운다는 뜻
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
