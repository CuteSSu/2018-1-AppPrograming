//
//  SaveViewController.swift
//  Week10-2
//
//  Created by SWUCOMPUTER on 2018. 5. 8..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var textTitle: UITextField!
    @IBOutlet var textContent: UITextView!
    
    var detailIdea: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let idea = detailIdea {
            textContent.text = idea.value(forKey: "ideaContent") as? String
            textTitle.text = idea.value(forKey: "ideaTitle") as? String
            let dbDate: Date? = idea.value(forKey: "ideaDate") as? Date
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd h:mm a"
            
           if let unwrapDate = dbDate {
            _ = formatter.string(from: unwrapDate as Date)
             //   ideaDate.text = displayDate
            }
        }
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
        
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Idea", in: context)
        
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(textContent.text, forKey: "ideaContent")
        object.setValue(Date(), forKey: "ideaDate")
        object.setValue(textTitle.text, forKey: "ideaTitle")
       
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)") }
        // 현재의 View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
    }
    

    
    /*MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
    }*/
}
