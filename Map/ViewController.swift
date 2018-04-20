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

class ViewController: UIViewController {

    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var LongitudeTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func searchBtn(_ sender: UIButton) {
    }
}

