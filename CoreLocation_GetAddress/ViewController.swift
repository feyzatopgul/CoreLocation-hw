//
//  ViewController.swift
//  CoreLocation_GetAddress
//
//  Created by fyz on 7/8/18.
//  Copyright © 2018 Feyza Topgul. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    var manager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let geocoding = CLGeocoder()
            geocoding.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                if let place = placemarks?.first {
                    let street = "\(place.thoroughfare!) \(place.subThoroughfare!)"
                    self.streetLabel.text = street
                    self.cityLabel.text = place.locality
                    self.stateLabel.text = place.administrativeArea
                    self.countryLabel.text = place.country
                }
            })
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

