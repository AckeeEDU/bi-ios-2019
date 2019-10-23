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
    var viewModel : ActionViewModel = ActionViewModel()
    
    @IBOutlet weak var controlPanel : ControlPanelView!

    override func loadView() {
        super.loadView()
        let placeGesture = UITapGestureRecognizer(target: self, action: #selector(placeGestureHandler(recognizer:)))
        view.addGestureRecognizer(placeGesture)

    }
    
    @objc func placeGestureHandler(recognizer : UITapGestureRecognizer) {
        let location = recognizer.location(in: self.view)
        let rect = viewModel.createShape(position: location)
        view.addSubview(rect)
    
    }
    
    func setupBindings() {
        controlPanel.colorSegment.addTarget(viewModel, action: #selector(viewModel.colorForControl(_:)), for: .valueChanged)
        controlPanel.shapeSegment.addTarget(viewModel, action: #selector(viewModel.shapeForControl(_:)), for: .valueChanged)
        controlPanel.sizeSlider.addTarget(viewModel, action: #selector(viewModel.sizeForControl(_:)), for: .valueChanged)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
}
