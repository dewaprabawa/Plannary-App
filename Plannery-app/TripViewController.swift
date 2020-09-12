//
//  ViewController.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 12/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class TripViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TripFunction.shared.readTrips{ [weak self] in
            self?.tableView.reloadData()
        }
        
        tableViewSetups()
    }

    
    private func tableViewSetups(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TripCell.nib(), forCellReuseIdentifier: TripCell.identifier)
    }

}

extension TripViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 120
        let cell = tableView.dequeueReusableCell(withIdentifier: TripCell.identifier, for: indexPath) as! TripCell
        let model = Data.tripModels[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

