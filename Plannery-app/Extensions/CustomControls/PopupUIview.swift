//
//  PopupUIview.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 14/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class PopupUIview:UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 1 
    }
}
