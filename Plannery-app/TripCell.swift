//
//  TripCell.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 13/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class TripCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageCard: UIImageView!

    static var identifier = "TripViewController"
    static func nib() -> UINib{
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    func configure(with model: TripModel){
        self.title.text = model.title
        self.title.textColor = .gray
        self.title.font = UIFont(name: Theme.boldFontTheme, size: 10)
        self.cardView.createCornerRadiusWithDropShadows()
        self.cardView.backgroundColor = .white
        self.imageCard.createCornerRadiusWithDropShadows()
        self.imageCard.image = model.image
    }
    
}
