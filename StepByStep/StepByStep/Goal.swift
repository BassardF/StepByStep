import UIKit

class Goal: NSObject {
    var title : String
    var details : String
    var milestones : [Milestone]
    
    init (title : String, withDetails details : String){
        self.title = title
        self.details = details
        milestones = [Milestone]()
        super.init();
    }
    
    func addMileStone(title : String){
        milestones.append(Milestone(title: title))
    }
    
    func removeMilestone(milestoneNumber : Int){
        milestones.removeAtIndex(milestoneNumber)
    }
    
}