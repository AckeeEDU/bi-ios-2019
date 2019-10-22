//
//  ActionViewController.swift
//  bi-ios-2018
//
//  Created by Dominik Vesely on 31/10/2018.
//  Copyright © 2018 ČVUT. All rights reserved.
//

import Foundation
import UIKit

class ActionViewController : UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func loadView() {
        super.loadView()
    }
    
    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
            case 1: view.backgroundColor = .green
            case 2: view.backgroundColor = .blue
            default: view.backgroundColor = .red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedValueChanged(segmentedControl)
    }
}
