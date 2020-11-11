//
//  UILabel.swift
//  RestoranMenu
//
//  Created by Yunus Makan on 10.11.2020.
//

import UIKit

extension UILabel {
    
//        MARK:- LABELIN YAZISINI DEGISIK FORMATTA YAZDIRAN EXTENSION.
    func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor){
            let strokeTextAttributes = [
                NSAttributedString.Key.strokeColor : oulineColor,
                NSAttributedString.Key.foregroundColor : foregroundColor,
                NSAttributedString.Key.strokeWidth : -4.0,
                NSAttributedString.Key.font : font ?? UIFont.systemFontSize
                ] as [NSAttributedString.Key : Any]
            self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
        }
    
}
