//
//  MapViewController.swift
//  ExampleApp
//
//  Created by Jan Misar on 20/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func loadView() {
        super.loadView()
        
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        self.mapView = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.delegate = self
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "MKMarkerAnnotationView")
        mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: "MKAnnotationView")
        
        mapView.removeAnnotations(mapView.annotations) // not necessary here, but useful when locations come from API
        
        mapView.addAnnotations(turtles)
        mapView.addAnnotations(hares)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // it's not good idea to re-zoom map on each appear, but good enough for our case now
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { // keep default behavior for user location pin
            return nil
        }
        
        switch annotation {
        case is MKUserLocation:
            return nil
        case let hare as Hare:
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: "MKMarkerAnnotationView") as! MKMarkerAnnotationView
            view.annotation = hare
            view.glyphImage = hare.image
            return view
        case let turtle as Turtle:
            let view = mapView.dequeueReusableAnnotationView(withIdentifier: "MKAnnotationView")!
            view.annotation = turtle
            view.image = turtle.image
            return view
        default:
            return nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
            
            locationManager.startUpdatingLocation() // we should also stop it somewhere!
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! // we are sure we have at least one location there
        print(location)
    }
    
    let hares = [
        Hare(coordinate: CLLocationCoordinate2D(latitude: 50.10155117, longitude: 14.50131164)),
        Hare(coordinate: CLLocationCoordinate2D(latitude: 50.04845155, longitude: 14.40643163)),
        Hare(coordinate: CLLocationCoordinate2D(latitude: 50.01436603, longitude: 14.48202576)),
        Hare(coordinate: CLLocationCoordinate2D(latitude: 50.09773545, longitude: 14.42862526)),
        Hare(coordinate: CLLocationCoordinate2D(latitude: 50.02386574, longitude: 14.418157)),
        Hare(coordinate: CLLocationCoordinate2D(latitude: 50.10891206, longitude: 14.50023615)),
        Hare(coordinate: CLLocationCoordinate2D(latitude: 50.13137991, longitude: 14.43188124)),
        Hare(coordinate: CLLocationCoordinate2D(latitude: 50.03085971, longitude: 14.43437316)),
        Hare(coordinate: CLLocationCoordinate2D(latitude: 50.05523586, longitude: 14.36531867)),
        Hare(coordinate: CLLocationCoordinate2D(latitude: 50.12467219, longitude: 14.39459484)),
        ]
    
    let turtles = [
        Turtle(coordinate: CLLocationCoordinate2D(latitude: 50.00616185, longitude: 14.41959398)),
        Turtle(coordinate: CLLocationCoordinate2D(latitude: 50.06693629, longitude: 14.43925259)),
        Turtle(coordinate: CLLocationCoordinate2D(latitude: 50.08936261, longitude: 14.53516745)),
        Turtle(coordinate: CLLocationCoordinate2D(latitude: 50.03396537, longitude: 14.48803967)),
        Turtle(coordinate: CLLocationCoordinate2D(latitude: 50.06252636, longitude: 14.49942098)),
        Turtle(coordinate: CLLocationCoordinate2D(latitude: 50.01692711, longitude: 14.37874073)),
        Turtle(coordinate: CLLocationCoordinate2D(latitude: 50.07238541, longitude: 14.37937722)),
        Turtle(coordinate: CLLocationCoordinate2D(latitude: 50.02807288, longitude: 14.51289626)),
        Turtle(coordinate: CLLocationCoordinate2D(latitude: 50.0276592, longitude: 14.48751812)),
        Turtle(coordinate: CLLocationCoordinate2D(latitude: 50.1340302, longitude: 14.45877785)),
    ]
}
