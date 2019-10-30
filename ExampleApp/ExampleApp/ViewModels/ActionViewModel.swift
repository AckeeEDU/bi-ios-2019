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
    var didUpdate : () -> () {get set}
    
    func createShape(position : CGPoint) -> ShapeView
    func removeShape(withTag tag: Int)
    
}


class ActionViewModelImpl : ActionViewModel {
        
    var selectedColor : UIColor = .red {
        didSet { didUpdate() }
    }
    var selectedSize : Float = 10 {
        didSet {
            didUpdate()
        }
    }
    var selectedShape : Int = 0 {
        didSet { didUpdate() }
    }
    var indexCounter = 0

    
    var shapes = [Shape]()
    var overview : String {
        get {
            return "Size: \(selectedSize) Count: \(shapes.count)"
        }
    }
    
    var didUpdate : () -> () = {}

    
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
        shapes.append(shape)
        didUpdate()

        return rect
    }
    
    @IBAction func colorForControl(_ sender: UISegmentedControl) {
        didUpdate()
    }
    
    @objc func sizeForControl(_ sender: UISlider) {
        selectedSize = sender.value
        didUpdate()
    }
    
    @objc func shapeForControl(_ sender: UISegmentedControl) {
        selectedShape = sender.selectedSegmentIndex
        didUpdate()
    }
    
    func removeShape(withTag tag: Int) {
        shapes = shapes.filter({ (el) -> Bool in
            el.tag != tag
        })
        didUpdate()
    }


    
}
