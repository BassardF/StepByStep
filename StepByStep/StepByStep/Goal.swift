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
    
    func addMileStone(title : String, withDate date : NSDate){
        milestones.append(Milestone(title: title, withDate : date))
    }
    
    func removeMilestone(milestoneNumber : Int){
        milestones.removeAtIndex(milestoneNumber)
    }
    
    func getMilestonesCount() -> Int {
        return milestones.count
    }
    
    func getCompletedRatio() -> Float {
        if getMilestonesCount() == 0 {
            return 0.0
        }
        var completedCount = 0
        for milestone in milestones {
            if milestone.isDone(){
                completedCount++
            }
        }
        return Float(completedCount) / Float(getMilestonesCount())
    }
    
}
