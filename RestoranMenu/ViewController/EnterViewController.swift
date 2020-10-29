//
//  EnterViewController.swift
//  RestoranMenu
//
//  Created by Yunus Makan on 20.10.2020.
//

import UIKit
import SideMenu

class EnterViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadNavigationBar()
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
}
