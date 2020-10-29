//
//  MainViewController.swift
//  RestoranMenu
//
//  Created by Yunus Makan on 16.10.2020.
//

import UIKit
import SideMenu
import BetterSegmentedControl

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    
    
    var mainModel = MainModel(typesTitle: ["KAHVALTI", "APERATİFLER", "SALATALAR", "IZGARA ÇEŞİTLERİ" , "İÇECEKLER", "TATLILAR", "SOĞUK IÇECEKLER", "SICAK İÇECEKLER"], images: ["kahvalti","aperatifler","salatalar","izgara","icecekler","tatlilar","sogukicecekler","sicakicecekler"]  )

    var chosenIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMainCollectionView()
        loadNavigationBar()
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainModel.typesTitle!.count
    }
    
// MARK: - Cell'in icinde ne olucagini soyleriz.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCollectionViewCell
        cell.titleLabel.text = mainModel.typesTitle![indexPath.row]
        cell.imageView.image = UIImage(named: mainModel.images![indexPath.row])
    
        return cell
    }
    
    func setMainCollectionView() {

        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self

        let cellSize = CGSize(width:(self.view.frame.width / 2 ) - 30 , height:150) //ekranin burada boyutuna gore ayarladik. / 2 diyerek iki stun olusturduk
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        layout.itemSize = cellSize
        layout.scrollDirection = .vertical //Yana mi gidicek asagiyami gidecek onu burda belirtiyoruz.
        mainCollectionView.setCollectionViewLayout(layout, animated: true)

    }
    
    //MARK:- hamburger menu ekleme kismi.iterm
    func loadNavigationBar() {
        
        let leftimage = UIImage(named: "menu")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftimage, style: .done, target: self, action: #selector(tappedMenu(_:)))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
        
        let rightImage = UIImage(named: "menu")
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightImage, style: .done, target: self, action: #selector(tappedRightbarButton))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }

    @objc func tappedRightbarButton(){

    }
    
    @objc func tappedMenu(_ sender:UIBarButtonItem!) {
        
        //let menu = SideMenuNavigationController(rootViewController: MainViewController)
        // SideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        let menu = storyboard!.instantiateViewController(withIdentifier: "RightMenu") as! SideMenuNavigationController
            present(menu, animated: true, completion: nil)
        //present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
        
        //dismiss(animated: true, completion: nil)
        
    
      }
    
//    MARK:- BURADA TIKLANDIGINDA NE OLUCAGINI BELIRTIYORUZ.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.myStoryboardName.instantiateViewController(identifier: "DetailsVC") as! DetailsViewController
        //let vc  = "Main".viewController(identifier: "DetailsVC") as! DetailsViewController //StoryBoard id si ile gecis yaptik segue ile degil.
        vc.modalPresentationStyle = .fullScreen
        
        vc.itemTitle = mainModel.typesTitle![indexPath.row]
        //vc.itemTitle = titleArray[indexPath.row] // diger vc deki degiskene ulasip deger esitledik.Normalde bu esitleme islemini override func prepare fonk ile yapiyoduk ama segue kullanmadigimiz icin burda hemen hizlica yaoabiliyoruz.
        
        vc.itemImage = UIImage(named: mainModel.images![indexPath.row])
        //vc.itemImage = imageArray[indexPath.row] // diger vc deki degiskene ulasip deger esitledik.
        
        vc.selectedIndex = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
