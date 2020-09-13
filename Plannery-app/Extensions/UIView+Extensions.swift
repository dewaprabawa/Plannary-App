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
       backgroundColor = .systemGreen
       layer.shadowOpacity = 1
       layer.shadowOffset = CGSize.zero
       layer.shadowColor = UIColor.darkGray.cgColor
       layer.cornerRadius = 10
    }
}
