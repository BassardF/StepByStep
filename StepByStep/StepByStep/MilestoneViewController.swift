//
//  MilestoneUIViewController.swift
//  StepByStep
//
//  Created by Frank Bassard on 15/09/2014.
//  Copyright (c) 2014 com.frankbassard. All rights reserved.
//

import UIKit

class MilestoneViewController: UIViewController {

    @IBOutlet var goalTitle: UILabel!
    @IBOutlet var goalProgressBar: UIProgressView!
    
    var goal : Goal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if goal != nil {
            goalTitle.text = goal?.title
        }
    }
}
