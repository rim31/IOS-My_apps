//
//  ViewController.swift
//  rush01
//
//  Created by Samuel TOUSSAY on 6/24/17.
//  Copyright © 2017 Samuel TOUSSAY. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController{
    let locationManager = CLLocationManager()

    @IBOutlet weak var sourceField: UITextField!
    @IBOutlet weak var destinationField: UITextField!
    @IBOutlet var enterButtonArray: [UIButton]!

    @IBAction func goButton(_ sender: Any) {
        view.endEditing(true)
        performSegue(withIdentifier: "showMap", sender: self)
    }

    @IBAction func searchPlace(_ sender: UIButton) {
        performSegue(withIdentifier: "searchPlace", sender: self)
    }

    var locationTuples: [(textField: UITextField?, mapItem: MKMapItem?)]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.requestLocation()
        }
        
        locationTuples = [(sourceField, nil), (destinationField, nil)]
    }

    var locationsArray: [(textField: UITextField?, mapItem: MKMapItem?)] {
        var filtered = locationTuples.filter({ $0.mapItem != nil })
        filtered += [filtered.first!]
        return filtered
    }

    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == "showMap"{
            if locationTuples[0].mapItem == nil || (locationTuples[1].mapItem == nil) {
                showAlert("Please enter a valid starting point and at least one destination.")
            }
        }
    }
    
    @IBAction func addressEntered(_ sender: UIButton) {
        view.endEditing(true)
        
        let currentTextField = locationTuples[sender.tag-1].textField

        CLGeocoder().geocodeAddressString(currentTextField!.text!, completionHandler: {
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if let placemarks = placemarks {
                var addresses = [String]()
                for placemark in placemarks {
                    addresses.append(self.formatAddressFromPlacemark(placemark: placemark))
                }
                self.showAddressTable(addresses: addresses, textField: currentTextField!, placemarks: placemarks, sender: sender)
            } else {
                self.showAlert("Address not found.")
            }
        })
    }
    
    @IBAction func swapFields(_ sender: AnyObject) {
        
    }
    
    func showAlert(_ alertString: String) {
        let alert = UIAlertController(title: nil, message: alertString, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK",
                                     style: .cancel) { (alert) -> Void in
        }
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }

    func formatAddressFromPlacemark(placemark: CLPlacemark) -> String {
        return (placemark.addressDictionary!["FormattedAddressLines"] as!
            [String]).joined(separator: ", ")
    }
    
    func showAddressTable(addresses: [String], textField: UITextField, placemarks: [CLPlacemark], sender: UIButton) {
        let addressTableView = AddressTableview(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)

        addressTableView.addresses = addresses
        addressTableView.currentTextField = textField
        addressTableView.placemarkArray = placemarks
        addressTableView.mainViewController = self
        addressTableView.sender = sender
        addressTableView.delegate = addressTableView
        addressTableView.dataSource = addressTableView
        view.addSubview(addressTableView)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        enterButtonArray.filter{$0.tag == textField.tag}.first!.isSelected = false
        locationTuples[textField.tag-1].mapItem = nil

        return true
    }

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(locations.last!, completionHandler: {
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if let placemarks = placemarks {
                let placemark = placemarks[0]

                // Add a MKMapItem representation of the user's current location
                self.locationTuples[0].mapItem = MKMapItem(placemark: MKPlacemark(coordinate: placemark.location!.coordinate, addressDictionary: placemark.addressDictionary as! [String: Any]?))

                // Sets the source UITextField with the new address.
                self.sourceField.text = self.formatAddressFromPlacemark(placemark: placemark)
                
                //Change the enter button style
                self.enterButtonArray.filter{$0.tag == 1}.first!.isSelected = true
                self.locationManager.stopUpdatingLocation()
            }
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var directionsViewController = segue.destination as! mapViewController
        directionsViewController.locationArray = locationsArray
    }
}

