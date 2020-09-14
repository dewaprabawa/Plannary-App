//
//  UIButton+Extensions.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 14/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit


extension UIButton{
    func createRoundedButton(){
        backgroundColor = Theme.tint
        layer.cornerRadius = self.frame.height/2
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    func createRoundedButtonWithLitleRadius(){
        layer.cornerRadius = 10
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.backgroundColor = Theme.tint?.cgColor
        self.tintColor = .white
        self.titleLabel?.font = UIFont(name: Theme.boldFontTheme, size: 20)
    }
}
