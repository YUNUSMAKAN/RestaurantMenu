//
//  UIGradient.swift
//  RestoranMenu
//
//  Created by MAKAN on 2.11.2020.
//

import Foundation
import UIKit

extension UIView {
    
        func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.locations = [0, 1]
            gradientLayer.frame = bounds
            layer.insertSublayer(gradientLayer, at: 0)

    }
}
