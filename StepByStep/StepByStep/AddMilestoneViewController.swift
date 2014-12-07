import UIKit

class AddMilestoneViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var milestoneTitle: UITextField!
    @IBOutlet var milestoneDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.milestoneTitle.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addMilestone(sender: UIBarButtonItem) {
        addAMilestone()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        addAMilestone()
        return true
    }
    
    func addAMilestone (){
        goals[selectedGoal].addMileStone(milestoneTitle.text, withDate: milestoneDatePicker.date)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
