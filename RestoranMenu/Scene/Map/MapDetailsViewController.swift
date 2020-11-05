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
    
    var locationName = ""
    var locationImage = ""
    var locationAddress = ""
    var locationPhone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 15
        customButton.layer.cornerRadius = 15 //Butonu ozellestirme islemi.
        
        
//MARK:- GRADIENT AYARLAMA ISLEMI!
        backgroundView.setGradientBackground(colorTop:UIColor.Color2, colorBottom:UIColor.white)
     
        titleNameLabel.text = locationName
        addressLabel.text = "ADRES: \(locationAddress)"
        phoneLabel.text = "İLETİŞİM: \(locationPhone)"
        imageView.image = UIImage(named: locationImage)
    }
    
    @IBAction func placeButton(_ sender: Any) {
        
    
    }
}
