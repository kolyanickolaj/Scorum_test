//
//  TutorialFirstVC.swift
//  Scorum_test
//
//  Created by Администратор on 25.03.2019.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import UIKit
import CoreLocation

class TutorialFirstVC: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
}
