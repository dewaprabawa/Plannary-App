//
//  TripModel.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 12/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class TripModel{
    let id: UUID
    var title: String
    var image: UIImage?
    
    init(title: String, image:UIImage? = nil) {
        self.title = title
        self.id = UUID()
        self.image = image
    }
}
