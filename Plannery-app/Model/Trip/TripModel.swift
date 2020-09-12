//
//  TripModel.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 12/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import Foundation

class TripModel{
    let id: UUID
    var title: String
    
    init(title: String) {
        self.title = title
        self.id = UUID()
    }
}
