//
//  Model.swift
//  d05
//
//  Created by Olivier SENG on 6/19/17.
//  Copyright © 2017 OS. All rights reserved.
//

import Foundation
import CoreLocation

struct donnees { //dictionnary :  tableau de string
    
    static var myInfos =
        [
            (lieu: "42", pays: "FRANCE", coord : CLLocationCoordinate2D(latitude: 48.896412, longitude: 2.318837)),
            (lieu: "Paris", pays: "FRANCE", coord :  CLLocationCoordinate2D(latitude: 48.858578, longitude: 2.294460)),
            (lieu: "New York", pays: "USA", coord : CLLocationCoordinate2D(latitude: 40.774694, longitude: -73.970199)),
            (lieu: "Toulouse", pays: "FRANCE", coord : CLLocationCoordinate2D(latitude: 43.604592, longitude: 1.443410))
        ]
}
