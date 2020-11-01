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

class MapViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var backgroundView: UIView!
    
    var locationManager = CLLocationManager()
    var mapModel = MapModel(locationName: ["İSTANBUL","ANKARA","İZMİR","KONYA","KAYSERİ","MARDİN","TRABZON","VAN","ELAZIĞ","ANTALYA","SİVAS","SAMSUN"], latitude: [41.048335,39.903555,38.417860,37.878694,38.723514,37.325703,40.810374,38.503016,38.710760,36.898054,39.528278,41.291532], longitude: [28.673412,32.622681,26.939633,32.366399,35.400147,40.327947,39.534671,43.288514,38.797710,30.648065,36.183928,36.278679])
    var chosenIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        setAnnotation()
    }
//    MARK:- GRADIENT AYARLAMA ISLEMI.
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        backgroundView.setGradientBackground(colorTop:UIColor.Color2, colorBottom:UIColor.white) //Renk-GRADIENT ayarlama islemi.
    }
    
    
//    MARK:- ANNOTATION LARI HARITADA YERLESTIRME ISLEMI!
    func setAnnotation() {
        
        for i in 0...11 {
        let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: mapModel.latitude[i], longitude: mapModel.longitude[i])
            annotation.title = mapModel.locationName[i]
            annotation.subtitle = "Menulux Restoran"
            mapView.addAnnotation(annotation)
        }
        
    }
    
//    MARK:- ANNOTATION LARI OZELLESTIRME ISLEMININ YAPILDIGI FONKSIYON!
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            if annotation is MKUserLocation {
                return nil
            }
            
            let reuseId = "pin"
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
            
            if pinView == nil {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                pinView?.canShowCallout = true
                //pinView?.image = UIImage(named: "sun1")
                pinView?.tintColor = UIColor.blue
                
                let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
                pinView?.rightCalloutAccessoryView = button
                
            }else {
                pinView?.annotation = annotation
            }
            return pinView
        }
    
//    MARK:- ANNOTATION NA TIKLANDIGINDA CIKAN BILGI BOLANUNDAKI BUTONUNA TIKLANDIGINDA NE OLUCAGINI BELIRTIYORUZ!
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
        let vc = UIStoryboard.myStoryboardName.instantiateViewController(identifier: "MapDetailsVC") as! MapDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        //self.navigationController?.pushViewController(vc, animated: true) //Navigasyon uzerinden gitmede bu kullanilir
        show(vc, sender: nil) //normal gecis icin bunu kullaniriz.
                    
        }
    
//    MARK:- KULLANICININ LOKASYONUNUN ALMA ISLEMININ YAPILDIGI FONKSIYON!
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)

        }

}
