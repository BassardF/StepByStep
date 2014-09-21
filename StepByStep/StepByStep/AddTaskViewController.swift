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
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool{
        if text == "\n" {
            taskDetails.resignFirstResponder()
            addATask()
            return false;
        }
        return true;
    }
    
    @IBAction func addTask(sender: AnyObject) {
        addATask()
    }
    
    func addATask() {
        goals[selectedGoal].milestones[selectedMilestone].addTask(taskTitle.text, withContent: taskDetails.text)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
