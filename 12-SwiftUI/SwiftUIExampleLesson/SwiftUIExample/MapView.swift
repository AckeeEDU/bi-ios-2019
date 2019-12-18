//
//  MapView.swift
//  SwiftUIExample
//
//  Created by Jakub Olejník on 18/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: View {
    @Binding var pins: [CLLocationCoordinate2D]
}

extension MapView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let pressGR = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.mapTapped(_:)))
        mapView.addGestureRecognizer(pressGR)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(pins.map(MKPointAnnotation.init))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, MKMapViewDelegate {
        private let map: MapView
        
        init(_ map: MapView) {
            self.map = map
        }
        
        @objc
        func mapTapped(_ sender: UILongPressGestureRecognizer) {
            guard sender.state == .recognized, let mapView = sender.view as? MKMapView else { return }
            
            let location = sender.location(in: mapView)
            let coordinates = mapView.convert(location, toCoordinateFrom: mapView)
            map.pins.append(coordinates)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    struct MapContainer: View {
        @State var pins = [CLLocationCoordinate2D]()
        
        var body: some View {
            MapView(pins: $pins)
        }
    }
    
    static var previews: some View {
        MapContainer()
            .edgesIgnoringSafeArea(.all)
    }
}
