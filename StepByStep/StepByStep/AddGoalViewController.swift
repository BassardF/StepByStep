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
    
    @IBAction func addGoal(sender: UIBarButtonItem) {
        goals.append(Goal(title: self.goalTitle.text, withDetails : self.goalDetails.text))
    }
}
