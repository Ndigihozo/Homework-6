//
//  ViewController.swift
//  Homework #6
//
//  Created by d.igihozo on 4/12/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var distanceLabel: UILabel!
    
    
    let locationManager: CLLocationManager = CLLocationManager()
    var startlocation: CLLocation!
    
    
    let kigaliLatitude: CLLocationDegrees = -1.935114
    let kigaliLongitude: CLLocationDegrees = 30.082111
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first else{return}
        
        let kigali:CLLocation = CLLocation(latitude: kigaliLatitude, longitude: kigaliLongitude)
        let distanceInMeters: CLLocationDistance = kigali.distance(from: currentLocation)
        let distanceInMiles: Double = (distanceInMeters/1609.344)
        
        if distanceInMiles < 3 {
            locationManager.startUpdatingLocation()
            distanceLabel.text = "Enjoy the land of a thousand hills!"
        }else{
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            let formattedDistance = formatter.string(from: NSNumber(value: distanceInMiles)) ?? ""
            distanceLabel.text = "\(formattedDistance) miles to Kigali"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.distanceFilter = 1609 // a mile in meters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startlocation = nil
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
}
