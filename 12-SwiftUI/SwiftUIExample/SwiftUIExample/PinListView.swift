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
        List(pins) { pin in
            Text(pin.description)
        }
        .navigationBarItems(trailing: NavigationLink(destination: AddPinView(pins: $pins)) {
            Text("Add")
        })
    }
}

struct PinListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PinListView(pins: .constant([CLLocationCoordinate2D(latitude: 15, longitude: 50)]))
                .navigationBarTitle("Pin list")
        }
    }
}

extension CLLocationCoordinate2D: Hashable, Identifiable, CustomStringConvertible {
    static let formatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 3
        return nf
    }()
    
    public var description: String {
        ["lat: " + CLLocationCoordinate2D.formatter.string(from: NSNumber(value: latitude))!,
         "lng: " + CLLocationCoordinate2D.formatter.string(from: NSNumber(value: longitude))!]
            .joined(separator: ", ")
    }
    
    public var id: Int { hashValue }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
    
    public static func==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && rhs.longitude == lhs.longitude
    }
}
