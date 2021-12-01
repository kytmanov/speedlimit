//
//  ViewController.swift
//  speedlimit
//
//  Created by Alexander Kytmanov on 11/22/19.
//  Copyright © 2019 Alexander Kytmanov. All rights reserved.
//

import UIKit
import CoreLocation
import os

class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    let speedLimit = Speedlimit()
    
    var speed: String = "N/A" {didSet{speedLabel.text = speed}}
    var coordinates: String = "N/A" {didSet{coordLabel.text = coordinates}}
    var maxSpeed: String = "N/A" {didSet{maxSpeedLabel.text = speedLimit.speedMax}}


    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var coordLabel: UILabel!
    @IBOutlet weak var maxSpeedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         locationManager.requestWhenInUseAuthorization()
         locationManager.desiredAccuracy = kCLLocationAccuracyBest
         locationManager.startUpdatingLocation()
         locationManager.delegate = self
        
        Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(self.runUpdate), userInfo: nil, repeats: true)
        UIApplication.shared.isIdleTimerDisabled = true
        print("isIdleTimerDisabled = true")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Timer.cancelPreviousPerformRequests(withTarget: runUpdate())
        UIApplication.shared.isIdleTimerDisabled = false
        print("isIdleTimerDisabled = false")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isIdleTimerDisabled = false
        print("isIdleTimerDisabled = false")
    }
    
    @objc func runUpdate(){
        speedLimit.updateMaxSpeed()
        maxSpeedLabel.text = speedLimit.speedMax
        print("Max speed: \(speedLimit.speedMax)")
    }
    

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        speedLimit.coordinates = manager.location!.coordinate
        
        if let latitude = speedLimit.coordinates?.latitude,
            let longitude = speedLimit.coordinates?.longitude{
            coordinates = String(latitude) + "/" + String(longitude)
            speedLimit.latitude = latitude
            speedLimit.longitude = longitude
        }
        
        if let speedDouble = manager.location?.speed {
            if speedDouble > 0 {
                speedLimit.speedCurrent = speedDouble.rounded()
                speedLabel.text = String(speedLimit.speedCurrent)
            } else {
                speedLimit.speedCurrent = 0
            }

        }

        print("Locations = \(coordinates)")
        print("Speed = \(String(describing: speed))")

    }
}

