//
//  ViewController.swift
//  Week09
//
//  Created by SWUCOMPUTER on 2018. 5. 1..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    let size: Int = 4
    
    var lottoArrays = Array<Array<Int>>()
    var orignalNumbers = Array(1 ... 45)
    
    
    
    

    var random: UInt32 = arc4random_uniform(45) + 1;
    
    
    
    @IBOutlet var lottoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        for i in 0..<orignalNumbers.count {
//            let rand = Int(arc4random_uniform(UInt32(orignalNumbers.count)))
//            lottoArrays.append(orignalNumbers[rand])
//            orignalNumbers.remove(at: rand)
//        }
        for i in 0 ... size-1 {
            for j in 0 ... 5 {
                lottoArrays[i][j] = Int(random)
                print(lottoArrays[i][j])
            }
        }

        //print(lottoArrays)
    
        
    }
    
    @IBAction func doDraw(_ sender: UIBarButtonItem) {
        
       // var array = Array(0 ... 5)
       // let random: UInt32 = arc4random_uniform(45) + 1;
        
        for i in 0 ... 5{
            orignalNumbers[i] = Int(random)
        }
        
        //print(array) // [10,9,8,7,6,5,4,3,2,1,0]
        
       // orignalNumbers.sort(by: {$0 < $1})
        
        print(orignalNumbers) // [0,1,2,3,4,5,6,7,8,9,10]
        
        lottoTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.lottoTableView.dequeueReusableCell(withIdentifier: "Lotto Cell", for: indexPath) as! LottoCell
        
        cell.number1.text = String(lottoArrays[indexPath.row][0])
        cell.number2.text = String(lottoArrays[indexPath.row][1])
        cell.number3.text = String(lottoArrays[indexPath.row][2])
        cell.number4.text = String(lottoArrays[indexPath.row][3])
        cell.number5.text = String(lottoArrays[indexPath.row][4])
        cell.number6.text = String(lottoArrays[indexPath.row][5])
        
      
        
        lottoArrays[indexPath.row][0] = orignalNumbers.sort(by: )
//         lottoArrays[indexPath.row][1] = orignalNumbers.count
//         lottoArrays[indexPath.row][2] = orignalNumbers.count
//         lottoArrays[indexPath.row][3] = orignalNumbers.count
//         lottoArrays[indexPath.row][4] = orignalNumbers.count
//         lottoArrays[indexPath.row][5] = orignalNumbers.count
        
        
        return cell
    }
}

