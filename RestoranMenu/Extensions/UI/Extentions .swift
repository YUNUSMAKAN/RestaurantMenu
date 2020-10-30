//
//  Extentions .swift
//  RestoranMenu
//
//  Created by Yunus Makan on 16.10.2020.
//

import Foundation
import UIKit

extension String {
    
  var storyboard: UIStoryboard {
    return UIStoryboard(name: self, bundle: nil)
  }
    
  var initialViewController: UIViewController {
    return storyboard.instantiateInitialViewController()!
  }
    
  func viewController(identifier: String) -> UIViewController {
    return storyboard.instantiateViewController(withIdentifier: identifier)
  }
}
