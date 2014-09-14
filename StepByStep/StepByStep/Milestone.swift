import UIKit

class Milestone: NSObject {
    var title : String
    var tasks : [Task]
    
    init (title : String){
        self.title = title
        tasks = [Task]()
        super.init();
    }
    
    func addTask (title : String, withContent content : String, withDate date : NSDate){
        self.tasks.append(Task(title: title, andContent: content, andDate: date))
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
}
