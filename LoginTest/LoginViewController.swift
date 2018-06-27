import UIKit
import CoreData
class LoginViewController: UIViewController {
    
    @IBOutlet var nameTextCheck: UITextField!
    @IBOutlet var passwordTextCheck: UITextField!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUPButtonAction(_ sender: Any) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let searchString = self.nameTextCheck.text
        let searcghstring2 = self.passwordTextCheck.text
        request.predicate = NSPredicate (format: "name == %@", searchString!)
        do
        {
            let result = try context.fetch(request)
            if result.count > 0
            {
                let   n = (result[0] as AnyObject).value(forKey: "name") as! String
                let p = (result[0] as AnyObject).value(forKey: "password") as! String
                //  print(" checking")
                
                
                if (searchString == n && searcghstring2 == p)
                {
                    let UserDetailsVc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
                    UserDetailsVc.myStringValue = nameTextCheck.text
                    self.navigationController?.pushViewController(UserDetailsVc, animated: true)
                }
                else if (searchString == n || searcghstring2 == p)
                {
                    // print("password incorrect ")
                    let alertController1 = UIAlertController (title: "no user found ", message: "password incorrect ", preferredStyle: UIAlertControllerStyle.alert)
                    alertController1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alertController1, animated: true, completion: nil)
                }
            }
            else
            {
                let alertController1 = UIAlertController (title: "no user found ", message: "invalid username ", preferredStyle: UIAlertControllerStyle.alert)
                alertController1.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alertController1, animated: true, completion: nil)
                print("no user found")
            }
        }
        catch
        {
            print("error")
        }
    }
}
