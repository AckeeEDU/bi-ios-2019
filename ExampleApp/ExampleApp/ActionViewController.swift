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
    
    
    var selectedColor : UIColor = .red
    
    @IBOutlet weak var controlPanel : ControlPanelView!

    override func loadView() {
        super.loadView()
        let placeGesture = UITapGestureRecognizer(target: self, action: #selector(placeGestureHandler(recognizer:)))
        view.addGestureRecognizer(placeGesture)
        controlPanel.colorSegment.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)

    }
    
    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
            case 1: selectedColor = .green
            case 2: selectedColor = .blue
            default: selectedColor = .red
        }
    }
    
    @objc func placeGestureHandler(recognizer : UITapGestureRecognizer) {
        let location = recognizer.location(in: self.view)
        let size = controlPanel.sizeSlider.value
        let rect = ShapeView(frame: CGRect(x: 0, y: 0, width: Double(size), height: Double(size)))
        let isRect = controlPanel.shapeSegment.selectedSegmentIndex == 1
        rect.frame.origin = location
        rect.layer.cornerRadius = isRect ? 0 : CGFloat(size / 2)
        rect.backgroundColor = selectedColor
        rect.action = {
            //leaking
            rect.removeFromSuperview()
        }
        view.addSubview(rect)
    
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
