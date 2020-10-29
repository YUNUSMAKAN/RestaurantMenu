//
//  MenuViewController.swift
//  RestoranMenu
//
//  Created by Yunus Makan on 20.10.2020.
//

import UIKit
import SideMenu

class SideMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var imageSetting: UIImageView!
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var sideMenuModel = SideMenuModel(typesTitle: ["KAHVALTI", "APERATİFLER", "SALATALAR", "IZGARA ÇEŞİTLERİ" , "İÇECEKLER", "TATLILAR", "SOĞUK IÇECEKLER", "SICAK İÇECEKLER"])
    var sideMenuMainModel = MainModel(typesTitle: ["KAHVALTI", "APERATİFLER", "SALATALAR", "IZGARA ÇEŞİTLERİ" , "İÇECEKLER", "TATLILAR", "SOĞUK IÇECEKLER", "SICAK İÇECEKLER"], images: ["kahvalti","aperatifler","salatalar","izgara","icecekler","tatlilar","sogukicecekler","sicakicecekler"] )
    var sideMenuDetailsModel = DetailsModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        MARK:-RESMI YUVARLAK HALE GETIRME ISLEMI
        imageLogo.layer.masksToBounds = true
        imageLogo.layer.cornerRadius = imageLogo.bounds.width / 2
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = sideMenuModel.typesTitle![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sideMenuModel.typesTitle.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.myStoryboardName.instantiateViewController(identifier: "DetailsVC") as! DetailsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.selectedIndex = indexPath.row
        vc.itemTitle = sideMenuMainModel.typesTitle![indexPath.row]
        vc.itemImage = UIImage(named: sideMenuMainModel.images![indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
        
        //present alttan gelen , show yandan navigasyondan gelen.
        
        
       
        
    }
    

}
