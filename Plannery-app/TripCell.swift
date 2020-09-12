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

    static var identifier = "TripViewController"
    static func nib() -> UINib{
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    func configure(with model: TripModel){
        self.title.text = model.title.uppercased()
        self.title.textColor = .white
        self.title.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        self.cardView.backgroundColor = .systemGreen
        self.cardView.layer.shadowOpacity = 1
        self.cardView.layer.shadowOffset = CGSize.zero
        self.cardView.layer.shadowColor = UIColor.darkGray.cgColor
    }
    
}
