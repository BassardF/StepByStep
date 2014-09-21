import UIKit

class MilestoneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var goalTitle: UILabel!
    @IBOutlet var goalProgressBar: UIProgressView!
    @IBOutlet var milestonesTableView: UITableView!
    let cellIdentifier = "milestoneCellIdentifier"
    
    var goal : Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goal = goals[selectedGoal]
        goalTitle.text = goal!.title
        goalProgressBar.setProgress(goal!.getCompletedRatio(), animated: true)
    }

    @IBAction func addMilestone(sender: AnyObject) {
    }
    
    //UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return goal!.milestones.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        cell.textLabel!.text = goal!.milestones[indexPath.row].title
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        cell.detailTextLabel!.text = dateFormatter.stringFromDate(goal!.milestones[indexPath.row].date)
        return cell
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        selectedMilestone = indexPath.row
        self.performSegueWithIdentifier("ShowTasks", sender: self)
    }
}
