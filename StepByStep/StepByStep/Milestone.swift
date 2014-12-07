import UIKit

class Milestone: NSObject {
    var title : String
    var donetasks : [Task]
    var todotasks : [Task]
    var date : NSDate
    
    init (title : String, withDate date : NSDate){
        self.title = title
        self.date = date
        donetasks = [Task]()
        todotasks = [Task]()
        super.init();
    }
    
    func addTodoTask (title : String, withContent content : String){
        self.todotasks.append(Task(title: title, andContent: content))
    }
    
    func addDoneTask (title : String, withContent content : String){
        self.donetasks.append(Task(title: title, andContent: content))
    }
    
    func removeDoneTask (taskNumber : Int){
        donetasks.removeAtIndex(taskNumber)
    }

    func removeTodoTask (taskNumber : Int){
        todotasks.removeAtIndex(taskNumber)
    }
    
    func getTasksCount() -> Int{
        return todotasks.count + donetasks.count
    }
    
    func getDoneTasksNumber() -> Int{
        return donetasks.count
    }
    
    func getTasksDoneRatio() -> Double{
        return Double(getDoneTasksNumber()) / Double(getTasksCount())
    }
    
    func isDone() -> Bool {
        return getTasksDoneRatio() == 1
    }
    
    func getDoneTaskNumber (doneTaskNumber : Int) -> Task {
        return donetasks[doneTaskNumber]
    }
    
    func getTodoTaskNumber (todoTaskNumber : Int) -> Task {
        return todotasks[todoTaskNumber]
    }
    
    func finishTaskNumber (number : Int) {
        var tmp = getTodoTaskNumber(number)
        todotasks.removeAtIndex(number)
        donetasks.insert(tmp, atIndex: 0)
    }
    
    func todoATask (number : Int){
        var tmp = getDoneTaskNumber(number)
        donetasks.removeAtIndex(number)
        todotasks.insert(tmp, atIndex: 0)
    }
}
