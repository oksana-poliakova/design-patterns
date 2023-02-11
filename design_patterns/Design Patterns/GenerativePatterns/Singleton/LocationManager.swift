//
//  LocationManager.swift
//  design_patterns
//
//  Created by Oksana Poliakova on 11.02.2023.
//

import Foundation

class LocationManager{
    
    static let shared = LocationManager()
    
    var locationGranted: Bool?
    
    //Initializer access level change now
    private init() { }
    
    func requestForLocation() {
        //Code Process
        locationGranted = true
        print("Location granted")
    }
}

func requestLocation() {
    //Access class function in a single line
    LocationManager.shared.requestForLocation()
}
