//
//  mapViewController.swift
//  rush01
//
//  Created by Samuel TOUSSAY on 6/24/17.
//  Copyright © 2017 Samuel TOUSSAY. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController, MKMapViewDelegate, UISearchBarDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    var locationArray: [(textField: UITextField?, mapItem: MKMapItem?)]!
    var activityIndicator: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        if locationArray[0].textField != locationArray[1].textField {
            addActivityIndicator()
            calculateSegmentDirections(index: 0, time: 0, routes: [])
        }
    }
    
    @IBAction func mygeolocButton(_ sender: Any) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        mapView.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
    }
    
    @IBAction func segmentButton(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }

    func calculateSegmentDirections(index: Int, time: TimeInterval, routes: [MKRoute]) {
        let request: MKDirectionsRequest = MKDirectionsRequest()

        request.source = locationArray[index].mapItem
        request.destination = locationArray[index+1].mapItem

        request.requestsAlternateRoutes = false

        request.transportType = .automobile

        let directions = MKDirections(request: request)

        directions.calculate (completionHandler: {
            (response: MKDirectionsResponse?, error: Error?) in
            if let routeResponse = response?.routes {
                let quickestRouteForSegment: MKRoute = routeResponse.sorted(by: {$0.expectedTravelTime < $1.expectedTravelTime})[0]
                
                var timeVar = time
                var routesVar = routes

                routesVar.append(quickestRouteForSegment)

                timeVar += quickestRouteForSegment.expectedTravelTime

                if index+2 < self.locationArray.count {
                    self.calculateSegmentDirections(index: index+1, time: timeVar, routes: routesVar)
                } else {
                    self.hideActivityIndicator()
                    self.showRoute(routes: routesVar)
                }
            } else if let _ = error {
                let alert = UIAlertController(title: nil, message: "Directions not available.", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .cancel) { (alert) -> Void in
                    self.navigationController?.popViewController(animated: true)
                }

                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    func showRoute(routes: [MKRoute]) {
//        for i in 0..<routes.count {
            plotPolyline(route: routes[0])
//        }
    }

    func addActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(frame: UIScreen.main.bounds)
        activityIndicator?.activityIndicatorViewStyle = .gray
        activityIndicator?.backgroundColor = view.backgroundColor
        activityIndicator?.startAnimating()
        view.addSubview(activityIndicator!)
    }
    
    func hideActivityIndicator() {
        if activityIndicator != nil {
            activityIndicator?.removeFromSuperview()
            activityIndicator = nil
        }
    }
    
    func plotPolyline(route: MKRoute) {
        self.mapView.add((route.polyline), level: MKOverlayLevel.aboveRoads)
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsetsMake(10.0, 10.0,10.0, 10.0), animated: false)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        
        if (overlay is MKPolyline) {
            polylineRenderer.strokeColor = UIColor.blue.withAlphaComponent(0.75)
            polylineRenderer.lineWidth = 5
        }
        return polylineRenderer
    }
    
    
    //=============================================
    
    
    var searchController:UISearchController!//presentation of the searche bar
    var annotation:MKAnnotation!//annotation on the map
    var localSearchRequest:MKLocalSearchRequest!//asynchrone
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearchResponse!
    var error:NSError!
    var pointAnnotation:MKPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    
    @IBAction func showSearchBar(_ sender: UIBarButtonItem) {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        //1 search bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        if self.mapView.annotations.count != 0{
            annotation = self.mapView.annotations[0]
            self.mapView.removeAnnotation(annotation)
        }
        //2 asynbchrone to jquery langage adress complete
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                let alertController = UIAlertController(title: nil, message: "Place Not Found", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            //3 mainwhile return of the API
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = searchBar.text
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
            
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
            self.mapView.addAnnotation(self.pinAnnotationView.annotation!)
        }
    }
}
