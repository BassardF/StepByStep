//
//  AddGoalViewController.swift
//  StepByStep
//
//  Created by Frank Bassard on 14/09/2014.
//  Copyright (c) 2014 com.frankbassard. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController {

    @IBOutlet var goalDetails: UITextView!
    @IBOutlet var goalTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goalTitle.becomeFirstResponder()
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool{
        if text == "\n" {
            textView.resignFirstResponder()
            addCurrentGoal()
            return false;
        }
        return true;
    }
    
    @IBAction func addGoal(sender: UIBarButtonItem) {
        addCurrentGoal()
    }
    
    func addCurrentGoal(){
        goals.append(Goal(title: self.goalTitle.text, withDetails : self.goalDetails.text))
        self.navigationController?.popToRootViewControllerAnimated(true);
    }
}
