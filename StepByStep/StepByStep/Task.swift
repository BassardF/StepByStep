import UIKit

class Task: NSObject {
    var title : String
    var content : String
    var date : NSDate?
    var done : Bool = false
    
    init (title: String, andContent content : String, andDate date : NSDate){
        self.title = title
        self.content = content
        self.date = date
        super.init();
    }
}
