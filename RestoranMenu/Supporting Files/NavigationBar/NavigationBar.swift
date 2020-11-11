//
//  NavigationBar.swift
//  RestoranMenu
//
//  Created by Yunus Makan on 16.10.2020.
//

import UIKit

class NavigationBar: UINavigationBar {

    var navTitle : UILabel!
    var logoView: UIImageView?
    var logoNameLabel: UILabel!


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.logoView = UIImageView()
        self.logoNameLabel = UILabel()
        self.logoView?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoView!)
        self.addSubview(logoNameLabel!)

    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.logoView = UIImageView()
        self.logoNameLabel = UILabel()
        setImageAndText()
        self.logoView?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoView!)
        self.addSubview(logoNameLabel!)
        self.setConstraints()
        self.shadowImage = UIImage()

    }

    func setImageAndText() {

        let image = UIImage(named: "newmenu")
        logoView!.layer.masksToBounds = true
        logoView!.layer.cornerRadius = 15
        self.logoView!.image = image
//        self.barTintColor = AppColor.pineGreen

    }

    func hideLogo(){
        self.logoView?.isHidden = true

    }

    func setTitle(title: String, _ controller: UIViewController) {
        
       navTitle = UILabel(frame: CGRect(x:0, y:0, width:self.intrinsicContentSize.width, height:50))
       navTitle.layer.zPosition = 1
       navTitle.numberOfLines = 0
       navTitle.textColor = UIColor.white
       navTitle.text = title
       controller.navigationItem.titleView = navTitle

       // back button text yok et

//       controller.navigationController?.navigationBar.topItem?.title = "divan"

//       controller.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }

    func setConstraints() {

        let heightConstraint = NSLayoutConstraint(item: self.logoView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 25)
        self.addConstraint(heightConstraint)
        
        var constraint = NSLayoutConstraint.init(item: self.logoView!,attribute: .top,relatedBy: .equal,toItem: self,attribute: .top,multiplier: 1,constant: 0)
        self.addConstraint(constraint)
        
        constraint = NSLayoutConstraint.init(item: self.logoView!,attribute: .bottom,relatedBy: .equal,toItem: self,attribute: .bottom,multiplier: 1,constant: 0)
        self.addConstraint(constraint)
        
        constraint = NSLayoutConstraint.init(item: self.logoView!,attribute: .height,relatedBy: .equal,toItem: self.logoView!,attribute: .width,  multiplier: (30.0 / 100.0),constant: 0)
        self.logoView!.addConstraint(constraint)

        constraint = NSLayoutConstraint.init(item: self.logoView!,attribute: .centerY,relatedBy: .equal,toItem: self,attribute: .centerY,multiplier: 1,constant:0)
        self.addConstraint(constraint)

        constraint = NSLayoutConstraint.init(item: self.logoView!,attribute: .centerX,relatedBy: .equal,toItem: self,attribute: .centerX,multiplier: 1,constant:0)
        self.addConstraint(constraint)


    }

}
