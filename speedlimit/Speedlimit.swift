//
//  Speedlimit.swift
//  speedlimit
//
//  Created by Alexander Kytmanov on 11/23/19.
//  Copyright © 2019 Alexander Kytmanov. All rights reserved.
//

import Foundation
import CoreLocation

class Speedlimit {    
    var longitude: Double
    var latitude: Double
    var speedCurrent: Double
    var speedMax: String
    var coordinates: CLLocationCoordinate2D?
    var wayNodes: [Element]?
    
//
//    init(longitude: Double, latitude: Double, speedCurrent: Double) {
//        self.longitude = longitude
//        self.latitude = latitude
//        self.speedCurrent = speedCurrent
//        self.speedMax = "N/A"
//    }
//
//    init(longitude: Double, latitude: Double) {
//        self.longitude = longitude
//        self.latitude = latitude
//        self.speedCurrent = 0
//        self.speedMax = "N/A"
//    }
    
    init(){
        self.longitude = 0
        self.latitude = 0
        self.speedCurrent = 0
        self.speedMax = "???."
    }
    
    func isCoordChanged(newCoordinates: CLLocationCoordinate2D, oldCoordinates: CLLocationCoordinate2D) -> Bool{
        if(newCoordinates.latitude - oldCoordinates.latitude > 0.000001){
            return true
        }
        return true
    }
    
    func updateMaxSpeed() {
        let query = QueryService(latitude: String(latitude), longitude: String(longitude))
        query.getNodes{[weak self] result in
            switch result {
            case .failure(let error):
                print("error")
            case .success(let nodes):
                self?.wayNodes = nodes.filter {$0.type.rawValue == "way"}
            }
        }
        
        if (wayNodes != nil && wayNodes!.count > 0){
             for node in wayNodes!{
                 speedMax = node.tags?.maxspeed as! String
             }
         }
    }
    
    
}
