//
//  University.swift
//  Mappap
//
//  Created by SWUCOMPUTER on 2018. 6. 5..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class University: NSObject, MKAnnotation{
    var title: String?
    var coordinate: CLLocationCoordinate2D
    init (title: String, latitude: Double, longitude: Double) {
        self.title = title
        self.coordinate = CLLocationCoordinate2D()
        self.coordinate.latitude = latitude
        self.coordinate.longitude = longitude
    }

}
