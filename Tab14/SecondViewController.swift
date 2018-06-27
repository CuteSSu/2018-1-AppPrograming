//
//  SecondViewController.swift
//  Tab14
//
//  Created by SWUCOMPUTER on 2018. 6. 12..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addWine() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.cart.append("와인 하나 추가요 ***")
        //print("와인 하나 추가요")
        let tabController = appDelegate.window?.rootViewController
        let tableVC = tabController?.childViewControllers[2] as! ThirdTableViewController
        tableVC.cartTab.badgeValue = String(format: "%d", appDelegate.cart.count)
        
        let application = UIApplication.shared
        application.applicationIconBadgeNumber = appDelegate.cart.count
    }
    
}

