import UIKit

var goals : [Goal] = [Goal]()
var selectedGoal = 0
var selectedMilestone = 0

class GoalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate{

    @IBOutlet var goalsTableView: UITableView!
    let cellIdentifier = "goalCellIdentifier"

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return goals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        cell.textLabel!.text = goals[indexPath.row].title
        cell.detailTextLabel!.text = goals[indexPath.row].details
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            goals.removeAtIndex(indexPath.row)
            goalsTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        selectedGoal = indexPath.row
        self.performSegueWithIdentifier("ShowMilestones", sender: self)
    }

}

