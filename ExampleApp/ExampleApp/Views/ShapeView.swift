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
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(ShapeView.tapGesture(gesture:)))
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ShapeView.doubleTapGesture(gesture:)))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(scalePiece(_:)))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panPiece(_:)))
        
        gestureTap.numberOfTapsRequired = 1
        doubleTap.numberOfTapsRequired = 2
        gestureTap.require(toFail: doubleTap)
        
        addGestureRecognizer(gestureTap)
        addGestureRecognizer(doubleTap)
        addGestureRecognizer(pinch)
        addGestureRecognizer(pan)
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
    
    @objc func panPiece(_ gestureRecognizer : UIPanGestureRecognizer) {
        guard gestureRecognizer.view != nil else {return}
        let piece = gestureRecognizer.view!
        // Get the changes in the X and Y directions relative to
        // the superview's coordinate space.
        let translation = gestureRecognizer.translation(in: piece.superview)
        
        // Update the position for the .began, .changed, and .ended states
        if gestureRecognizer.state != .cancelled {
            // Add the X and Y translation to the view's original position.
            let newCenter = CGPoint(x: piece.center.x + translation.x, y: piece.center.y + translation.y)
            piece.center = newCenter
        }
        
        gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: piece.superview)
        
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
