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

        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap(recognizer:)))
        doubleTap.numberOfTapsRequired = 2
        placeGesture.require(toFail: doubleTap)
        view.addGestureRecognizer(doubleTap)
        
        
    }
    
    @objc func placeGestureHandler(recognizer : UITapGestureRecognizer) {
        let location = recognizer.location(in: self.view)
        let shape = viewModel.createShape(position: location)
        shape.action = { [weak self, weak shape] in
            self?.viewModel.removeShape(shape: shape!)
            shape?.removeFromSuperview()
        }

        view.addSubview(shape)
    
    }
    
    @objc func doubleTap(recognizer : UITapGestureRecognizer) {
        
        let consoleVC = ConsoleViewController(viewModel: viewModel)
        present(consoleVC, animated: true, completion: nil)
    
    }
    
    func setupBindings() {
        controlPanel.colorSegment.addTarget(viewModel, action: #selector(viewModel.colorForControl(_:)), for: .valueChanged)
        controlPanel.shapeSegment.addTarget(viewModel, action: #selector(viewModel.shapeForControl(_:)), for: .valueChanged)
        controlPanel.sizeSlider.addTarget(viewModel, action: #selector(viewModel.sizeForControl(_:)), for: .valueChanged)
        viewModel.didUpdate = {
            self.controlPanel.valuesLabel.text = self.viewModel.overView
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
}
