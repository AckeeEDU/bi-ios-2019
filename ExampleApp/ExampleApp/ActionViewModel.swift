//
//  ActionViewModel.swift
//  bi-ios-2018
//
//  Created by Dominik Vesely on 06/11/2018.
//  Copyright © 2018 ČVUT. All rights reserved.
//

import Foundation
import UIKit


struct Shape {
    let tag : Int
    let color : UIColor
    let  size : Float
    let origin : CGPoint
}


class ActionViewModel {
    
    var selectedColor : UIColor = .red
    var selectedSize : Float = 10
    var selectedShape : Int = 0
    
    var shapes = [Shape]()
    var overView : String {
        get {
            return "Size: \(selectedSize) Count: \(shapes.count)"
        }
    }
    
    var didUpdate : () -> () = {}

    
    func createShape(position: CGPoint) -> UIView {
        let size = selectedSize
        let rect = ShapeView(frame: CGRect(x: 0, y: 0, width: Double(size), height: Double(size)))
        let isRect = selectedShape == 1
        rect.frame.origin = position
        rect.layer.cornerRadius = isRect ? 0 : CGFloat(size / 2)
        rect.backgroundColor = selectedColor
        rect.action = { [weak rect] in
            //leaking
            rect?.removeFromSuperview()
        }
        let shape = Shape(tag: shapes.count, color: selectedColor, size: selectedSize, origin: position)
        shapes.append(shape)
        didUpdate()

        return rect
    }
    
    @IBAction func colorForControl(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 1: selectedColor = .green
        case 2: selectedColor = .blue
        default: selectedColor = .red
        }
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

    
}
