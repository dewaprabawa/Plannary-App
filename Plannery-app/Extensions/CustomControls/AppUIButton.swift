//
//  AppUIButton.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 14/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = Theme.tint
        layer.cornerRadius = self.frame.height/2
        setTitleColor(.white, for: .normal)
    }
}
