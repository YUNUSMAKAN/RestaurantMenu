//
//  MapDetailsViewController.swift
//  RestoranMenu
//
//  Created by MAKAN on 30.10.2020.
//

import UIKit
import MapKit

class MapDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var reservationList: UIButton!
    
    var locationName = ""
    var locationImage = ""
    var locationAddress = ""
    var locationPhone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 15
        customButton.layer.cornerRadius = 15 //Butonu ozellestirme islemi.
        reservationList.layer.cornerRadius = 15
        addressLabel.makeOutLine(oulineColor: .customPink, foregroundColor: .blue)
        phoneLabel.makeOutLine(oulineColor: .customPink, foregroundColor: .blue)
        titleNameLabel.makeOutLine(oulineColor: .customPink, foregroundColor: .blue)
        
        
//MARK:- GRADIENT AYARLAMA ISLEMI!
        backgroundView.setGradientBackground(colorTop:UIColor.Color2, colorBottom:UIColor.white)
     
        titleNameLabel.text = locationName
        addressLabel.text = "ADRES: \(locationAddress)"
        phoneLabel.text = "İLETİŞİM: \(locationPhone)"
        imageView.image = UIImage(named: locationImage)
    }
    
    @IBAction func placeButton(_ sender: Any) {
        
        let vc = UIStoryboard.myStoryboardName.instantiateViewController(identifier: "ReservationVC") as! ReservationViewController
        vc.modalPresentationStyle = .fullScreen
        vc.selectedPlace = locationName
        vc.screnType = .new
        //self.navigationController?.pushViewController(vc, animated: true)
        show(vc, sender: nil)
    }
    
    @IBAction func reservationList(_ sender: Any) {
        let vc = UIStoryboard.myStoryboardName.instantiateViewController(identifier: "ReservationListVC") as! ReservationDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.selectedPlace = locationName
        //self.navigationController?.pushViewController(vc, animated: true)
        show(vc, sender: nil)
    }
}
