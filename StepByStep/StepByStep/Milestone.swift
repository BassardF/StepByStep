import UIKit

class Milestone: NSObject {
    var title : String
    var tasks : [Task]
    var date : NSDate
    
    init (title : String, withDate date : NSDate){
        self.title = title
        self.date = date
        tasks = [Task]()
        super.init();
    }
    
    func addTask (title : String, withContent content : String){
        self.tasks.append(Task(title: title, andContent: content))
    }
    
    func removeTask (taskNumber : Int){
        tasks.removeAtIndex(taskNumber)
    }
    
    func getTasksCount() -> Int{
        return tasks.count
    }
    
    func getDoneTasksNumber() -> Int{
        var count = 0
        for task in tasks {
            if task.done{
                count++
            }
        }
        return count
    }
    
    func getTasksDoneRatio() -> Double{
        return Double(getDoneTasksNumber()) / Double(getTasksCount())
    }
    
    func isDone() -> Bool {
        return getTasksDoneRatio() == 1
    }
}
