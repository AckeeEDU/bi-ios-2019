//
//  LeakView.swift
//  bi-ios-2018
//
//  Created by Dominik Vesely on 31/10/2018.
//  Copyright © 2018 ČVUT. All rights reserved.
//

import Foundation
import UIKit

class ShapeView : UIView  {
    
    var action : () -> () = {
        print("action")
    }
    
    //wait for it
    let hugeArray = Array(0...1000000)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(ShapeView.tapGesture(gesture:)))
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ShapeView.doubleTapGesture(gesture:)))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(scalePiece(_:)))

        gestureTap.numberOfTapsRequired = 1
        doubleTap.numberOfTapsRequired = 2
        gestureTap.require(toFail: doubleTap)
                
        addGestureRecognizer(gestureTap)
        addGestureRecognizer(doubleTap)
        addGestureRecognizer(pinch)
    }
    
    
    
    @objc func tapGesture(gesture : UITapGestureRecognizer) {
        action()
    }
    
    @objc func doubleTapGesture(gesture : UITapGestureRecognizer) {
        print("action2")
    }
    
    @objc func scalePiece(_ gestureRecognizer : UIPinchGestureRecognizer) {
        guard gestureRecognizer.view != nil else { return }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = (gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale))!
            gestureRecognizer.scale = 1.0
        }
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
