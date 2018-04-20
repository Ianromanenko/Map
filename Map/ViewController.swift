//
//  ViewController.swift
//  Map
//
//  Created by Yan on 2018-04-20.
//  Copyright © 2018 centennialcollege. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var LongitudeTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationManager = CLLocationManager()
    private var previousPoint: CLLocation?
    private var totalMovementDistance = CLLocationDistance(0)
    
    var latitude = Double()
    var longitude = Double()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        mapView.showsUserLocation = true
    }
    
    
    
    @IBAction func searchBtn(_ sender: UIButton) {
        guard let lat = latitudeTextField.text else {return}
        guard let long = LongitudeTextField.text else {return}
        
        if latitudeTextField.text != "" && LongitudeTextField.text != "" {
            
        newLocation(forLatitude: Double(lat)!, forLongitude: Double(long)!)
            
        }
    }
    
    
    func newLocation(forLatitude: Double, forLongitude: Double) {
        
        let span = MKCoordinateSpanMake(0.1, 0.01)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: forLatitude, longitude: forLongitude), span: span)
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(forLatitude, forLongitude)
        let pinObject = MKPointAnnotation()
        
        mapView.setRegion(region, animated: true)
        
        pinObject.coordinate = pinLocation
        pinObject.title = "You entered"
        pinObject.subtitle = "This Location"
        
        self.mapView.addAnnotation(pinObject)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation : CLLocation = locations[0] as CLLocation
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        
        locationManager.stopUpdatingLocation()
        
        mapView.setRegion(region, animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
    



