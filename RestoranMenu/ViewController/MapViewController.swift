//
//  MapViewController.swift
//  RestoranMenu
//
//  Created by MAKAN on 30.10.2020.
//

import UIKit
import MapKit
import CoreData
import CoreLocation

class MapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapView.delegate = self
    }
   

}
