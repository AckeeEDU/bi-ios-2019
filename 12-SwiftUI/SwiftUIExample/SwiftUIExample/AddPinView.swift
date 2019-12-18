//
//  AddPinView.swift
//  SwiftUIExample
//
//  Created by Jakub Olejník on 18/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import CoreLocation
import SwiftUI

struct AddPinView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @Binding var pins: [CLLocationCoordinate2D]
    @State private var latitude = ""
    @State private var longitude = ""
    
    private var isValid: Bool { Double(latitude) != nil && Double(longitude) != nil }
    
    var body: some View {
        Form {
            Section(header: Text("Latitude")) {
                TextField("Enter value", text: $latitude)
            }
            Section(header: Text("Longitude")) {
                TextField("Enter value", text: $longitude)
            }
            Button(action: submit) {
                Text("Submit")
            }.enabled(isValid)
        }
    }
    
    private func submit() {
        let newPin = CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
        
        if pins.contains(newPin) { return }
        
        pins.append(newPin)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddPinView_Previews: PreviewProvider {
    static var previews: some View {
        AddPinView(pins: .constant([]))
    }
}
