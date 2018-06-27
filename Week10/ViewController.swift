//
//  ViewController.swift
//  Week10
//
//  Created by SWUCOMPUTER on 2017. 11. 7..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(_ tableView: UITableView)->Int {
        return 1
    }

    func tableView(_tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return 0
    }

    func tableView(_tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath)->UITableViewCell {
        let cell=UITableViewCell()
        return cell
    }
}

