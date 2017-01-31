//
//  MapVC.swift
//  WhereWasI
//
//  Created by Dan Lindsay on 2017-01-31.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        updateSavedPin()
        
    }
    
    func updateSavedPin() {
        if let oldCoords = DataStorage().getLastLocation() {
            
            let annoRemove = mapView.annotations.filter{$0 !== mapView.userLocation}
            mapView.removeAnnotations(annoRemove)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double(oldCoords.latitude)!
            annotation.coordinate.longitude = Double(oldCoords.longitude)!
            
            annotation.title = "I was here!"
            annotation.subtitle = "Remember?"
            mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            print("Location not enabled")
            return
        }
        
        print("Location allowed")
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        let coord = locationManager.location?.coordinate
        
        if let lat = coord?.latitude {
            if let long = coord?.longitude {
                DataStorage().storeDataPoint(latitude: String(lat), longitude: String(long))
                updateSavedPin()
            }
        }
    }

}

