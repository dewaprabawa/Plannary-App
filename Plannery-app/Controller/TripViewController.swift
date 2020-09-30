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
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TripFunction.shared.readTrips{ [weak self] in
            self?.tableView.reloadData()
        }
        tableViewSetups()
        setupViews()
    }
    
    private func setupViews(){
        addButton.createRoundedButton()
    }
    
    private func tableViewSetups(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TripCell.nib(), forCellReuseIdentifier: TripCell.identifier)
    }
    
    private func navigationSetups(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Trips"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "TripAddAction" {
            if let destination = segue.destination as? TripAddAction {
                destination.doneSaving = { [weak self] in
                    print("clicked")
                    self?.doneSaved()
                }
            }
        }
    }
    
    
    private func doneSaved(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerfomred: (Bool) -> Void) in
            TripFunction.shared.deleteTrip(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
        
        delete.image = UIImage(systemName: "delete.left")
        
       
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

