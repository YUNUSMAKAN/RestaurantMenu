//
//  MapDetailsViewController.swift
//  RestoranMenu
//
//  Created by MAKAN on 30.10.2020.
//

import UIKit

class MapDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    var mapDetailsModel = MapDetailsModel(locationName: ["İSTANBUL ŞUBESİ","ANKARA ŞUBESİ","İZMİR ŞUBESİ","KONYA ŞUBESİ","KAYSERİ ŞUBESİ","MARDİN ŞUBESİ","TRABZON ŞUBESİ","VAN ŞUBESİ","ELAZIĞ ŞUBESİ","ANTALYA ŞUBESİ","SİVAS ŞUBESİ","SAMSUN ŞUBESİ"], address: ["İSTANBUL MERKEZ","ANKARA MERKEZ","İZMİR MERKEZ","KONYA MERKEZ","KAYSERİ MERKEZ","MARDİN MERKEZ","TRABZON MERKEZ","VAN MERKEZ","ELAZIĞ MERKEZ","ANTALYA MERKEZ","SİVAS MERKEZ","SAMSUN MERKEZ"], phone: [123456789123,123456789123,123456789123,123456789123,123456789123,123456789123,123456789123,123456789123,123456789123,123456789123,123456789123,123456789123],images:["istanbul","ankara","izmir","konya","kayseri","mardin","trabzon","van","elazig","antalya","sivas","samsun"])
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.setGradientBackground(colorTop:UIColor.Color2, colorBottom:UIColor.white) //Gradient ayarlama islemi!
        
        titleNameLabel.text = mapDetailsModel.locationName[selectedIndex]
        addressLabel.text = "ADRES: \(mapDetailsModel.address[selectedIndex])"
        phoneLabel.text = "İLETİŞİM: \(String(mapDetailsModel.phone[selectedIndex]))"
        imageView.image = UIImage(named: mapDetailsModel.images[selectedIndex])
    }
    
    @IBAction func placeButton(_ sender: Any) {
        
    }
    

}
