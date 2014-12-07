import UIKit

class AddTaskViewController: UIViewController, UITextViewDelegate {

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
        goals[selectedGoal].milestones[selectedMilestone].addTodoTask(taskTitle.text, withContent: taskDetails.text)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool{
        taskDetails.text = ""
        return true
    }
}
