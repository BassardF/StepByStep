import UIKit

class AddMilestoneViewController: UIViewController {

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
        goals[selectedGoal].addMileStone(milestoneTitle.text, withDate: milestoneDatePicker.date)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
