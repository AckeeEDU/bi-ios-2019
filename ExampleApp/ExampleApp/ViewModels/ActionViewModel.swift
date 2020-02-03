//
//  ActionViewModel.swift
//  bi-ios-2018
//
//  Created by Dominik Vesely on 06/11/2018.
//  Copyright © 2018 ČVUT. All rights reserved.
//

import Foundation
import UIKit

protocol ActionViewModel {
    
    var selectedColor : UIColor {get set}
    var selectedSize : Float {get set}
    var selectedShape : Int {get set}
    var indexCounter : Int {get}
    
    var shapes : [Shape] {get}
    var overview : String {get}
    var didUpdate : (ActionViewModel) -> () {get set}
    
    func createShape(position : CGPoint) -> ShapeView
    func removeShape(withTag tag: Int)
    
}


class ActionViewModelImpl : ActionViewModel {
    
    
    var shapeService: ShapeService
        
    var selectedColor : UIColor = .red {
        didSet { didUpdate(self) }
    }
    var selectedSize : Float = 10 {
        didSet {
            didUpdate(self)
        }
    }
    var selectedShape : Int = 0 {
        didSet { didUpdate(self) }
    }
    var indexCounter = 0

    
    var shapes : [Shape] {
        return shapeService.shapes
    }
    
    var overview : String {
        get {
            return "Size: \(selectedSize) Count: \(shapes.count)"
        }
    }
    
    var didUpdate : (ActionViewModel) -> () = { _ in }
    
    init(shapeService : ShapeService) {
        self.shapeService = shapeService
    }

    
    func createShape(position: CGPoint) -> ShapeView {
        let size = selectedSize
        let rect = ShapeView(frame: CGRect(x: 0, y: 0, width: Double(size), height: Double(size)))
        let isRect = selectedShape == 1
        rect.frame.origin = position
        rect.layer.cornerRadius = isRect ? 0 : CGFloat(size / 2)
        rect.backgroundColor = selectedColor
        rect.tag = indexCounter
        indexCounter += 1
        let shape = Shape(tag: rect.tag, color: selectedColor, size: selectedSize, origin: position)
        shapeService.addShape(shape: shape)
        didUpdate(self)

        return rect
    }
    
    @IBAction func colorForControl(_ sender: UISegmentedControl) {
        didUpdate(self)
    }
    
    @objc func sizeForControl(_ sender: UISlider) {
        selectedSize = sender.value
        didUpdate(self)
    }
    
    @objc func shapeForControl(_ sender: UISegmentedControl) {
        selectedShape = sender.selectedSegmentIndex
        didUpdate(self)
    }
    
    func removeShape(withTag tag: Int) {
        guard let shape = shapeService.findShape(tag: tag) else { return }
        shapeService.removeShape(shape: shape)
        didUpdate(self)
    }


    
}
