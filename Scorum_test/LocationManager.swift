//
//  LocationManager.swift
//  Scorum_test
//
//  Created by Администратор on 26.03.2019.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager : NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()

    let locationManager = CLLocationManager()
    var fetchedCity:String = ""
    var fetchedLatitude:CLLocationDegrees = 0
    var FetchedLongitude:CLLocationDegrees = 0
    var authStatus:CLAuthorizationStatus = .notDetermined


    func beginWork() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            
            authStatus = status
            
            NotificationCenter.default.post(name: Notification.Name("AuthorisationSuccess"), object: nil)
            
            if let location = locationManager.location {
                fetchedLatitude = location.coordinate.latitude
                FetchedLongitude = location.coordinate.longitude
                
                fetchCityAndCountry(from: location) { city, error in
                    guard let city = city, error == nil else { return }
                    self.fetchedCity = city
                    
                    NotificationCenter.default.post(name: Notification.Name("NeedToFetchWeather"), object: nil)
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locationManager.location {
            fetchedLatitude = location.coordinate.latitude
            FetchedLongitude = location.coordinate.longitude
            
            fetchCityAndCountry(from: location) { city, error in
                guard let city = city, error == nil else { return }
                self.fetchedCity = city
                
                NotificationCenter.default.post(name: Notification.Name("NeedToFetchWeather"), object: nil)
            }
        }
    }
    
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,
                       error)
        }
    }
    
    func authorised() -> Bool {
        if authStatus == .authorizedAlways || authStatus == .authorizedWhenInUse {
            return true
        }
        return false
    }
    


}
