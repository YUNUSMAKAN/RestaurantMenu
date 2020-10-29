//
//  DetailsViewController.swift
//  RestoranMenu
//
//  Created by Yunus Makan on 16.10.2020.
//

import UIKit


class DetailsViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title2Label: UILabel!
    @IBOutlet weak var detailsCollectionView: UICollectionView!
   
    
   
    var itemTitle : String!
    var itemImage : UIImage!
    
    var selectedIndex = 0
    
    var detailsModel = DetailsModel(typeName: [["Kahvaltı Tabağı", "Sucuklu Tost", "Sigara Böreği","Omlet", "Patates Kızartması"],
                                               ["Kumpir","Paçanga Böreği","Mücver","Kısır","Humus"],
                                               ["Yumurta Salatasi","Peynir Salatasi","Roka Salatasi","Coban Salatasi","Mevsim Salatasi"],
                                               ["Patlicanli Kebap","Adana Kebap","Tavuk Sis","Urfa Kebap","Karisik Kebap"],
                                               ["Su","Cola","Fanta","Ice Tea","Limonata"],
                                               ["Künefe","Baklava","Profiterol","Trilece","Firinda Sutlac"],
                                               ["Limonata", "Fanta","Soda","Ice Tea","Cola"],
                                               ["Türk Kahvesi","Çay","Ihlamur","Ada Çayı","Espresso"]],
                                    
                        typeDefinition: [ ["Domates,salatalik,zeytin,peynir, cay.",
                                           "Tost ekmeginde sucuk ve kasarli tost.",
                                           "Peynirli 8 adet sigara boregi.",
                                           "ister peynirli, isterseniz sebzeli yapilabilir.",
                                           "Zeytin yaginda kizartilmis dilim patates."],
                                          ["Güzel","Harika","Mükemmel","Muhteşem","Kusursuz"],
                                          ["Güzel","Harika","Mükemmel","Muhteşem","Kusursuz"],
                                          ["Güzel","Harika","Mükemmel","Muhteşem","Kusursuz"],
                                          ["Güzel","Harika","Mükemmel","Muhteşem","Kusursuz"],
                                          ["Güzel","Harika","Mükemmel","Muhteşem","Kusursuz"],
                                          ["Güzel","Harika","Mükemmel","Muhteşem","Kusursuz"],
                                          ["Güzel","Harika","Mükemmel","Muhteşem","Kusursuz"]],
                        typePrice: [ [14,23,16,14,12],
                                     [11,14,25,14,11],
                                     [14,21,17,10,11],
                                     [40,45,34,34,65],
                                     [3,6,5,7,9],
                                     [12,11,23,12,13],
                                     [9,5,4,5,6],
                                     [11,5,8,8,15]],
                        typeImage: [["kahvaltitabagi","sucuklutost","sigaraboregi","omlet","pkizartmasi"],
                                    ["kumpir","pacangaboregi","mucver","kisir","humus"],
                                    ["yumurtasalatasi","peynirsalatasi","rokasalatasi","cobansalatasi","mevsimsalatasi"],
                                    ["patlicanlikebap","adanakebap","tavuksis","urfakebap","karisikkebap"],
                                    ["su","cola","fanta","icetea","limonata"],
                                    ["kunefe","baklava","profiterol","trilece","firindasutlac"],
                                    ["limonata","fanta","soda","icetea","cola"],
                                    ["turkkahvesi","cay","ihlamur","adacayi","espresso"]
                                   ]) //String olarak ekledik daha sonra UIImage a ceviririz.
   
    override func viewDidLoad() {
        super.viewDidLoad()

        title2Label.text = itemTitle
        imageView.image = itemImage
        
        setMainCollectionView()
        setSegmentedControl()
    }
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
        //return detailsModel.typePrice!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! DetailsCollectionViewCell
        cell.titleLabel.text = detailsModel.typeName[selectedIndex][indexPath.row]
        cell.definitionLabel.text = detailsModel.typeDefinition[selectedIndex][indexPath.row]
        cell.imageView.image = UIImage(named: detailsModel.typeImage![selectedIndex][indexPath.row]) //string olarak aldigimiz imagelari uiimage ile cevirdik
        cell.priceLabel.text = String(detailsModel.typePrice[selectedIndex][indexPath.row])
        
        return cell
        
    }
    
    func setMainCollectionView() {

        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self

        let cellSize = CGSize(width:(self.view.frame.width) - 40 , height:150) //ekranin burada boyutuna gore ayarladik.
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        layout.itemSize = cellSize
        layout.scrollDirection = .vertical //Yana mi gidicek asagiyami gidecek onu burda belirtiyoruz.
        detailsCollectionView.setCollectionViewLayout(layout, animated: true)

    }
    

}
