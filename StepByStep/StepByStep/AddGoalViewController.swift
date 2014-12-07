import UIKit

class AddGoalViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var goalDetails: UITextView!
    @IBOutlet var goalTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goalTitle.becomeFirstResponder()
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool{
        if text == "\n" {
            textView.resignFirstResponder()
            addCurrentGoal()
            return false;
        }
        return true;
    }
    
    @IBAction func addGoal(sender: UIBarButtonItem) {
        addCurrentGoal()
    }
    
    func addCurrentGoal(){
        goals.append(Goal(title: self.goalTitle.text, withDetails : self.goalDetails.text))
        self.navigationController?.popToRootViewControllerAnimated(true);
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool{
        goalDetails.text = ""
        return true
    }

}
