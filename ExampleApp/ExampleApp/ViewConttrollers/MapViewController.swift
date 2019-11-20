//
//  MapViewController.swift
//  ExampleApp
//
//  Created by Jan Misar on 20/11/2019.
//  Copyright © 2019 CVUT. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

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
        
        mapView.removeAnnotations(mapView.annotations) // not necessary here, but useful when locations come from API
        
        locations.forEach { location in
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "A location"
            annotation.subtitle = "A location subtitle"
            mapView.addAnnotation(annotation)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // it's not good idea to re-zoom map on each appear, but good enough for our case now
        mapView.showAnnotations(mapView.annotations, animated: true)
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
    
    let locations = [
        CLLocationCoordinate2D(latitude: 50.10155117, longitude: 14.50131164),
        CLLocationCoordinate2D(latitude: 50.04845155, longitude: 14.40643163),
        CLLocationCoordinate2D(latitude: 50.01436603, longitude: 14.48202576),
        CLLocationCoordinate2D(latitude: 50.09773545, longitude: 14.42862526),
        CLLocationCoordinate2D(latitude: 50.02386574, longitude: 14.418157),
        CLLocationCoordinate2D(latitude: 50.10891206, longitude: 14.50023615),
        CLLocationCoordinate2D(latitude: 50.13137991, longitude: 14.43188124),
        CLLocationCoordinate2D(latitude: 50.03085971, longitude: 14.43437316),
        CLLocationCoordinate2D(latitude: 50.05523586, longitude: 14.36531867),
        CLLocationCoordinate2D(latitude: 50.12467219, longitude: 14.39459484),
        CLLocationCoordinate2D(latitude: 50.00616185, longitude: 14.41959398),
        CLLocationCoordinate2D(latitude: 50.06693629, longitude: 14.43925259),
        CLLocationCoordinate2D(latitude: 50.08936261, longitude: 14.53516745),
        CLLocationCoordinate2D(latitude: 50.03396537, longitude: 14.48803967),
        CLLocationCoordinate2D(latitude: 50.06252636, longitude: 14.49942098),
        CLLocationCoordinate2D(latitude: 50.01692711, longitude: 14.37874073),
        CLLocationCoordinate2D(latitude: 50.07238541, longitude: 14.37937722),
        CLLocationCoordinate2D(latitude: 50.02807288, longitude: 14.51289626),
        CLLocationCoordinate2D(latitude: 50.0276592, longitude: 14.48751812),
        CLLocationCoordinate2D(latitude: 50.1340302, longitude: 14.45877785),
    ]
}
