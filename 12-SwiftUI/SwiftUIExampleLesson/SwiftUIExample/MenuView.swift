//
//  MenuView.swift
//  SwiftUIExample
//
//  Created by Jakub Olejník on 18/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import CoreLocation
import SwiftUI

struct MenuView: View {
    @State var pins = [CLLocationCoordinate2D]()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                NavigationLink(destination: MapView(pins: $pins)) {
                    Text("Map")
                }
                
                NavigationLink(destination: PinListView(pins: $pins)) {
                    Text("Pin list")
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
