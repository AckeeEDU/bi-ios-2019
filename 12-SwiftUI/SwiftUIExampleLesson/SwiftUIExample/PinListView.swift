//
//  PinListView.swift
//  SwiftUIExample
//
//  Created by Jakub Olejník on 18/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import CoreLocation
import SwiftUI

struct PinListView: View {
    @Binding var pins: [CLLocationCoordinate2D]
    
    var body: some View {
        Text(pins.map { $0.description }.joined(separator: "\n"))
    }
}

extension CLLocationCoordinate2D: CustomStringConvertible {
    public var description: String {
        "lat: \(latitude), lng: \(longitude)"
    }
}
