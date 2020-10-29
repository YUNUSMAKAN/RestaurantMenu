//
//  StoryboardExtension.swift
//  RestoranMenu
//
//  Created by Yunus Makan on 19.10.2020.
//

import Foundation
import UIKit
//StoryyBoradID si ile ekranlar arasi gitme isleminde kullanilan bir extension dir.

public extension UIStoryboard {
    
  static var myStoryboardName: UIStoryboard {
    
     return UIStoryboard(name: "Main", bundle: .main)
  }
}

public extension UIStoryboard {
    
  static var newStoryboard: UIStoryboard {
    
     return UIStoryboard(name: "NewStroyboard", bundle: .main)
  }
}
 
