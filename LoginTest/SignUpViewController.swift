import UIKit
import CoreData
class SignUpViewController: UIViewController {
    
    @IBOutlet var nameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var ageText: UITextField!
    @IBOutlet var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func SignUPAction(_ sender: Any) {
        if isValidInput(Input: nameText.text!)
        {
            if isPasswordValid(passwordText.text!)
            {
                if isValidEmail(testStr: emailText.text!)
                {
                    let _:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
                    let context:NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as NSManagedObject
                    newUser.setValue(nameText.text, forKey: "name")
                    newUser.setValue(passwordText.text, forKey: "password")
                    newUser.setValue(emailText.text, forKey: "email")
                    newUser.setValue(ageText.text, forKey: "age")
                    do {
                        try context.save()
                    } catch {}
                    print(newUser)
                    print("Object Saved.")
                    let alertController1 = UIAlertController (title: "Valid ", message: "Sucess ", preferredStyle: UIAlertControllerStyle.alert)
                    alertController1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alertController1, animated: true, completion: nil)
                    
                    
                    let UserDetailsVc = self.storyboard?.instantiateViewController(withIdentifier: "logoutViewController") as! LoginViewController
                    
                    self.navigationController?.pushViewController(UserDetailsVc, animated: true)
                    
                }else
                {
                    print("mail check")
                    let alertController1 = UIAlertController (title: "Fill Email id", message: "Enter valid email", preferredStyle: UIAlertControllerStyle.alert)
                    
                    alertController1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alertController1, animated: true, completion: nil)
                }
            }
            else
            {
                print("pswd check")
                let alertController1 = UIAlertController (title: "Fill the password ", message: "Enter valid password", preferredStyle: UIAlertControllerStyle.alert)
                alertController1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertController1, animated: true, completion: nil)
            }
        }
        else
        {
            print("name check")
            
            let alertController1 = UIAlertController (title: "Fill the Name ", message: "Enter valid username", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController1, animated: true, completion: nil)
        }
    }
    func isValidInput(Input:String) -> Bool
    {
        let RegEx = "\\A\\w{3,18}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{3,}")
        return passwordTest.evaluate(with: password)
    }
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
