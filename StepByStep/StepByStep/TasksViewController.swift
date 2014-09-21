import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "taskCellIdentifier"
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
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return goals[selectedGoal].milestones[selectedMilestone].tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        cell.textLabel!.text = goals[selectedGoal].milestones[selectedMilestone].tasks[indexPath.row].title
        cell.detailTextLabel!.text = goals[selectedGoal].milestones[selectedMilestone].tasks[indexPath.row].content
        return cell
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {

    }
}
