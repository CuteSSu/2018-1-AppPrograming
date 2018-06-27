//
//  FirstViewController.swift
//  Week14
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

    @IBAction func addCoffee(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.coffee.append("커피 하나 추가요~")
        
        let tabController = appDelegate.window?.rootViewController
        let tableVC01 = tabController?.childViewControllers[1] as! SecondTableViewController
        tableVC01.coffeeTab.badgeValue = String(format: "%d", appDelegate.coffee.count)
        
        
        let application = UIApplication.shared
        application.applicationIconBadgeNumber = appDelegate.coffee.count
    }
    
    @IBAction func addMartini() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.martini.append("마티니 하나 추가요!!")
        
        let tabController = appDelegate.window?.rootViewController
        let tableVC = tabController?.childViewControllers[2] as! ThirdTableViewController
        tableVC.martiniTab.badgeValue = String(format: "%d", appDelegate.martini.count)
        
        
        let application = UIApplication.shared
        application.applicationIconBadgeNumber = appDelegate.martini.count
    }
}

