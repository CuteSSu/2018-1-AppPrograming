import UIKit
import CoreData
class UserDetailsViewController: UIViewController {
    @IBOutlet var nameText: UITextField!
    @IBOutlet var ageText: UITextField!
    @IBOutlet var emailText: UITextField!
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var myStringValue : String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showData()
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    func showData()
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.predicate = NSPredicate (format: "name == %@", myStringValue!)
        do
        {
            let result = try context.fetch(request)
            if result.count > 0
            {
                let nameData = (result[0] as AnyObject).value(forKey: "name") as! String
                let agedata = (result[0] as AnyObject).value(forKey: "age") as! String
                let emaildata = (result[0] as AnyObject).value(forKey: "email") as! String
                nameText.text = nameData
                ageText.text = agedata
                emailText.text = emaildata
            }
        }
        catch {
            //handle error
            print(error)
        }
    }
}
