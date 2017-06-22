//
//  FirstViewController.swift
//  d05
//
//  Created by OS on 6/19/17.
//  Copyright © 2017 OS. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    var annotations : [MKPointAnnotation] = []
    static var indexLoc = 0
    var lastIndexLoc = -1
    
    override func viewWillAppear(_ animated : Bool)
    {
        if FirstViewController.indexLoc != lastIndexLoc
        {
            myZoom()//on zoom sur le point
            lastIndexLoc = FirstViewController.indexLoc
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for loc in donnees.myInfos
        {
            let annotation = MKPointAnnotation()
            annotation.coordinate = loc.coord
            annotation.subtitle = loc.pays
            annotation.title = loc.lieu
            mapView.addAnnotation(annotation)
            annotations.append(annotation)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func segmentControllerAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }

    @IBAction func geolocButton(_ sender: UIButton) {

        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
        //ajouter NSLocationWhenInUseUsageDescription dans info.pliste
        //Privacy - Location Always Usage Description
        //        self.mapView.showsUserLocation = true
    }
    
    
    
    

    func myZoom(coord : MKCoordinateSpan = MKCoordinateSpanMake(0.05, 0.05)) /*on met une valeur par defaut ici*/ {
        
        let span = coord

        // now move the map
        let region = MKCoordinateRegion(center: annotations[FirstViewController.indexLoc].coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

