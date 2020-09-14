//
//  UIView+Extensions.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 13/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

extension UIView{
    func createCornerRadiusWithDropShadows(){
       layer.shadowOpacity = 1
       layer.shadowOffset = CGSize.zero
       layer.shadowColor = UIColor.systemGreen.cgColor
       layer.cornerRadius = 10
    }
    
    func createRoundedWithLitleRadius(){
        layer.cornerRadius = 10
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
}
