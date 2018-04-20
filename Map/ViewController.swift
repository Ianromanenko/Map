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
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: span)
        
        mapView.showsUserLocation = true
    }
    
    
    
    @IBAction func searchBtn(_ sender: UIButton) {
        guard let lat = latitudeTextField.text else {return}
        guard let long = LongitudeTextField.text else {return}
        
        //    latitude = Double(lat)
        //    longitude = Double(long)
        
        if latitudeTextField.text != "" && LongitudeTextField.text != "" {
            
            getLocatin(forLatitude: Double(lat)!, forLongitude: Double(long)!)
            
        }
    }
    
    
    
    
    func getLocatin(forLatitude: Double, forLongitude: Double) {
        let span = MKCoordinateSpanMake(0.1, 0.01)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: forLatitude, longitude: forLongitude), span: span)
        
        mapView.setRegion(region, animated: true)
        
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(forLatitude, forLongitude)
        let pinObject = MKPointAnnotation()
        
        pinObject.coordinate = pinLocation
        pinObject.title = "You entered"
        pinObject.subtitle = "This Location"
        
        self.mapView.addAnnotation(pinObject)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation : CLLocation = locations[0] as CLLocation
        locationManager.stopUpdatingLocation()
        
        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
    }

    
    
    }
    



