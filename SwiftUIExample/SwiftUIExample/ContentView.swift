//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Jakub Olejník on 17/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    enum RowItem: String, CaseIterable {
        case example
        case map
        case pinList
        
        var title: String {
            switch self {
            case .example: return "Example"
            case .map: return "Map"
            case .pinList: return "Pin list"
            }
        }
    }
    
    @State var pins = [CLLocationCoordinate2D]()
    
    var body: some View {
        NavigationView {
            List(RowItem.allCases, id: \.rawValue) { row in
                NavigationLink(destination: self.destinationView(row: row)) {
                    Text(row.title)
                }
            }
            .navigationBarTitle("Menu")
        }
    }
    
    func destinationView(row: RowItem) -> AnyView {
        let title = Text(row.title)
        
        switch row {
        case .example: return AnyView(ExampleView().navigationBarTitle(title, displayMode: .inline))
        case .map: return AnyView(MapView(pins: $pins).navigationBarTitle(title, displayMode: .inline).edgesIgnoringSafeArea(.all))
        case .pinList: return AnyView(PinListView(pins: $pins).navigationBarTitle(title, displayMode: .inline))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
