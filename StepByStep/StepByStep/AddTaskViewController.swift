import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet var taskTitle: UITextField!
    @IBOutlet var taskDetails: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskTitle.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addTask(sender: AnyObject) {
        goals[selectedGoal].milestones[selectedMilestone].addTask(taskTitle.text, withContent: taskDetails.text)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
