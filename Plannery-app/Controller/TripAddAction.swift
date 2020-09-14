//
//  TripAddAction.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 14/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class TripAddAction: UIViewController {
    
    @IBOutlet weak var actionCard:UIView!
    @IBOutlet weak var tripAddLabel:UILabel!
    @IBOutlet weak var addTextField:UITextField!
    @IBOutlet weak var cancelButton:UIButton!
    @IBOutlet weak var saveButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews(){
        tripAddLabel.textColor = Theme.tint
        tripAddLabel.font = UIFont(name: Theme.boldFontTheme, size: 20)
        actionCard.createRoundedWithLitleRadius()
        
        saveButton.createRoundedButtonWithLitleRadius()
        cancelButton.createRoundedButtonWithLitleRadius()
        
     }
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
    }
}
