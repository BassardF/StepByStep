//
//  FirstViewController.swift
//  StepByStep
//
//  Created by Frank Bassard on 13/09/2014.
//  Copyright (c) 2014 com.frankbassard. All rights reserved.
//

import UIKit

var goals : [Goal] = [Goal]()

class GoalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate{

    @IBOutlet var goalsTableView: UITableView!
    let cellIdentifier = "cellIdentifier"
    var selectedGoal = 0

    
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
    
    // UITableViewDelegate methods
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowMilestones" {
            var milestoneController : MilestoneViewController = segue.destinationViewController as MilestoneViewController
            milestoneController.goal = goals[selectedGoal]
        }
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        selectedGoal = indexPath.row
        self.performSegueWithIdentifier("ShowMilestones", sender: self)
    }

}

