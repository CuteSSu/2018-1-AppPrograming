//
//  FirstViewController.swift
//  Tab14
//
//  Created by SWUCOMPUTER on 2018. 6. 12..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import UserNotifications


class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // "shared" returns the singleton app instance
        let application = UIApplication.shared
        let center = UNUserNotificationCenter.current()
        // Requests authorization to interact with the user
        // when local and remote notifications arrive
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
        if granted { print("Approval granted to send notifications") }
        else { print(error!) } }
        application.registerForRemoteNotifications()
        // First VC 가 처음 실행되는 VC 이므로 이곳에 한번만 설정하면 됨
        application.applicationIconBadgeNumber = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addBear() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.cart.append("맥주 하나 추가요 ~")
        //print("맥주 하나 추가요")
        
        let tabController = appDelegate.window?.rootViewController
        let tableVC = tabController?.childViewControllers[2] as! ThirdTableViewController
        tableVC.cartTab.badgeValue = String(format: "%d", appDelegate.cart.count)
        let application = UIApplication.shared
        application.applicationIconBadgeNumber = appDelegate.cart.count
    }
    
}

