import UIKit

class Task: NSObject {
    var title : String
    var content : String
    var done : Bool = false
    
    init (title: String, andContent content : String){
        self.title = title
        self.content = content
        super.init();
    }
}
