//
//  MapView.swift
//  SwiftUIExample
//
//  Created by Jakub Olejník on 17/12/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: View {
    @Binding var pins: [CLLocationCoordinate2D]
    @State private var showPins = ()
    
    private func addPin(_ coordinate: CLLocationCoordinate2D) {
        if pins.contains(coordinate) { return }
        pins.append(coordinate)
    }
    
    func showAllPins() {
        showPins = ()
    }
}

extension MapView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let map = MKMapView()
        let pressGR = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.mapTapped))
        map.addGestureRecognizer(pressGR)
        map.delegate = context.coordinator
        map.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "Annotation")
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let oldAnnotations = uiView.annotations.compactMap { $0 as? MKPointAnnotation }
        let newAnnotations = pins.map(MKPointAnnotation.init)
        
        let changes = newAnnotations.difference(from: oldAnnotations)
        
        changes.forEach { change in
            switch change {
            case .insert(_, let annotation, _):
                uiView.addAnnotation(annotation)
            case .remove(_, let annotation, _):
                uiView.removeAnnotation(annotation)
            }
        }
        
        if changes.count > 0 {
            uiView.showAnnotations(uiView.annotations, animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, MKMapViewDelegate {
        var map: MapView

        init(_ map: MapView) {
            self.map = map
        }

        @objc func mapTapped(sender: UILongPressGestureRecognizer) {
            guard sender.state == .recognized else { return }
            
            let mapView = sender.view as! MKMapView
            let coordinate = mapView.convert(sender.location(in: mapView), toCoordinateFrom: mapView)
            map.addPin(coordinate)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: "Annotation", for: annotation) as! MKMarkerAnnotationView
            view.markerTintColor = .blue
            return view
        }
    }
}

struct MapView_Preview: PreviewProvider {
    struct MapContainer: View {
        @State var pins = [CLLocationCoordinate2D]()

        var body: some View {
            MapView(pins: $pins)
        }
    }
    
    static var previews: some View {
        Group {
            MapContainer().previewDevice("iPhone SE")

            MapContainer().previewDevice("iPhone XS")
                .environment(\.colorScheme, .dark)
        }.edgesIgnoringSafeArea(.all)
    }
}
