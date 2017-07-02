//
//  intineraireViewController.swift
//  rush01
//
//  Created by Olivier SENG on 6/24/17.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit
import MapKit

class intineraireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var departField: UITextField!

    @IBOutlet weak var arriveField: UITextField!
//    var locationArray = []
//    locationArray[index] =
//    locationArray[index+1] =
//    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    // calcule de route
//    func calculateSegmentDirections(index: Int) {
//        // 1
//        let request: MKDirectionsRequest = MKDirectionsRequest()
////        request.source = locationArray[index].mapItem
////        request.destination = locationArray[index+1].mapItem
//        request.source = departField
//        rea
//        // 2
//        request.requestsAlternateRoutes = true
//        // 3
//        request.transportType = .Automobile
//        // 4
//        let directions = MKDirections(request: request)
//        directions.calculateDirectionsWithCompletionHandler ({
//            (response: MKDirectionsResponse?, error: NSError?) in
//            if let routeResponse = response?.routes {
//                
//            } else if let _ = error {
//                
//            }
//        })
//    }
    
    
    //====================================================
    
    var searchController1:UISearchController!//presentation of the search bar
    var annotation:MKAnnotation!//annotation on the map
    var localSearchRequest:MKLocalSearchRequest!//asynchrone
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearchResponse!
    var error:NSError!
    var pointAnnotation:MKPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    
//    @IBAction func goButton(_ sender: UIButton) {
//        searchController1 = UISearchController(searchResultsController: nil)
//        searchController1.hidesNavigationBarDuringPresentation = false
//        self.searchController1.searchBar.delegate = self
//        present(searchController1, animated: true, completion: nil)
//    }
    
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
//        //1 search bar
//        searchBar.resignFirstResponder()
//        dismiss(animated: true, completion: nil)
//        if self.mapView.annotations.count != 0{
//            annotation = self.mapView.annotations[0]
//            self.mapView.removeAnnotation(annotation)
//        }
//        //2 asynbchrone to jquery langage adress complete
//        localSearchRequest = MKLocalSearchRequest()
//        localSearchRequest.naturalLanguageQuery = searchBar.text
//        localSearch = MKLocalSearch(request: localSearchRequest)
//        localSearch.start { (localSearchResponse, error) -> Void in
//            
//            if localSearchResponse == nil{
//                let alertController = UIAlertController(title: nil, message: "Place Not Found", preferredStyle: UIAlertControllerStyle.alert)
//                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alertController, animated: true, completion: nil)
//                return
//            }
//            //3 mainwhile return of the API
//            self.pointAnnotation = MKPointAnnotation()
//            self.pointAnnotation.title = searchBar.text
//            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
//            
//            
//            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
//            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
//            self.mapView.addAnnotation(self.pinAnnotationView.annotation!)
//        }
//    }
//    

}
