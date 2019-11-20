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
    var viewModel : ActionViewModel = ActionViewModelImpl(shapeService: ArrayShapeService())
    
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
            self?.viewModel.removeShape(withTag: shape!.tag)
            shape?.removeFromSuperview()
        }

        view.addSubview(shape)
    
    }
    
    @objc func doubleTap(recognizer : UITapGestureRecognizer) {
        
        let consoleVC = ConsoleViewController(viewModel: viewModel)
        present(consoleVC, animated: true, completion: nil)
    
    }
    
    func setupBindings() {
        controlPanel.colorSegment.addTarget(self, action: #selector(handleColor), for: .valueChanged)
        controlPanel.shapeSegment.addTarget(self, action: #selector(handleShape), for: .valueChanged)
        controlPanel.sizeSlider.addTarget(self, action: #selector(handleSize), for: .valueChanged)
        viewModel.didUpdate = {
            self.controlPanel.valuesLabel.text = self.viewModel.overview
        }

    }
    
    
    @objc func handleColor(_ control: UISegmentedControl) {
        let index = control.selectedSegmentIndex
        switch index {
        case 1: viewModel.selectedColor = .green
        case 2: viewModel.selectedColor = .blue
        default: viewModel.selectedColor = .red
        }
    }
    
    @objc func handleSize(_ control: UISlider) {
        viewModel.selectedSize = control.value
    }
    
    @objc func handleShape(_ control: UISegmentedControl) {
        viewModel.selectedShape = control.selectedSegmentIndex
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
}
