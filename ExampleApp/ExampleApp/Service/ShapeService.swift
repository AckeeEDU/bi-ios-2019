//
//  ShapeService.swift
//  ExampleApp
//
//  Created by Dominik Vesely on 30/10/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import Foundation

protocol ShapeService {
    
    func addShape(shape: Shape)
    func removeShape(shape: Shape)
    func findShape(tag: Int) -> Shape?
    var shapes : [Shape] { get }
    
}

class ArrayShapeService : ShapeService {
    
    
    func addShape(shape: Shape) {
        shapes.append(shape)
    }
    
    func removeShape(shape: Shape) {
        shapes = shapes.filter({ (el) -> Bool in
            el.tag != shape.tag
        })
    }
    
    func findShape(tag: Int) -> Shape? {
        return shapes.first { $0.tag == tag }
    }
    
    var shapes = [Shape]()
       
}
