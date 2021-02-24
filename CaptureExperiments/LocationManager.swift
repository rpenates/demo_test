//
//  LocationManager.swift
//  CaptureExperiments
//
//  Created by Rafael Peñates on 24/02/21.
//

import Foundation
import Combine
import CoreLocation

class LocationManager: NSObject, ObservableObject{
    
    @Published var userLatitude: Double = 0
    @Published var userLongitude: Double = 0
    
    @Published var currentLocation: CLLocation = CLLocation()
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        //        self.locationManager.startUpdatingLocation()
    }
    
    func startLocationService() {
        self.locationManager.startUpdatingLocation()
    }
    
    func stopLocationService() {
        self.locationManager.stopUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        userLatitude = location.coordinate.latitude
        userLongitude = location.coordinate.longitude
        
        self.currentLocation = location
        print(location)
    }
}
