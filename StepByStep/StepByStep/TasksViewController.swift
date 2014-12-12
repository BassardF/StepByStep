import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "taskCellIdentifier"
    let doneCellIdentifier = "doneTaskCellIdentifier"
    @IBOutlet var taskTableView: UITableView!
    var milestone : Milestone?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0 {
            return goals[selectedGoal].milestones[selectedMilestone].getTodoTasksCount()
        }
        else{
            return goals[selectedGoal].milestones[selectedMilestone].getDoneTasksCount()
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String {
        if section == 0 {
            return "Todo"
        }
        else{
            return "Done"
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.section == 0{
            var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
            var task = goals[selectedGoal].milestones[selectedMilestone].getTodoTaskNumber(indexPath.row)
            cell.textLabel!.text = task.title
            cell.detailTextLabel!.text = task.content
            return cell
        } else{
            var cell = tableView.dequeueReusableCellWithIdentifier(self.doneCellIdentifier) as UITableViewCell
            var task = goals[selectedGoal].milestones[selectedMilestone].getDoneTaskNumber(indexPath.row)
            cell.textLabel!.text = task.title
            cell.detailTextLabel!.text = task.content
            return cell
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            if indexPath.section == 0 {
                goals[selectedGoal].milestones[selectedMilestone].removeTodoTask(indexPath.row)
            } else if indexPath.section == 1 {
                goals[selectedGoal].milestones[selectedMilestone].removeDoneTask(indexPath.row)
            }
            taskTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        if indexPath.section == 0 {
            goals[selectedGoal].milestones[selectedMilestone].finishTaskNumber(indexPath.row)
        } else if indexPath.section == 1 {
            goals[selectedGoal].milestones[selectedMilestone].todoATask(indexPath.row)
        }
        taskTableView.reloadData()
    }
}
