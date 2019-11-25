//
//  MapAnnotations.swift
//  ExampleApp
//
//  Created by Jan Misar on 20/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import MapKit

class Hare: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    var title: String? = "Hare"
    var subtitle: String? = "Running fast!"
    
    let image = UIImage(systemName: "hare.fill")
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

class Turtle: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D // must be `var` to enable dragging in the map
    var title: String? = "Turtle"
    var subtitle: String? = "Going slow..."
    
    let image = UIImage(systemName: "tortoise.fill")
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
