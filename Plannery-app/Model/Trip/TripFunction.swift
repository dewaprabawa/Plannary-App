//
//  TripFunction.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 12/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit


class TripFunction{
    
    static var shared = TripFunction()
    
    func createTrip(trip: TripModel){
        Data.tripModels.append(trip)
    }
    
    func readTrips(completion:@escaping () -> ()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Bali!",image: UIImage(systemName: "photo")))
                Data.tripModels.append(TripModel(title: "Mexico",image: UIImage(systemName: "photo")))
                Data.tripModels.append(TripModel(title: "Russian Trip", image: UIImage(systemName: "photo")))
            }
        }
        
        DispatchQueue.main.async {
            completion()
        }
        
    }
    
    
    func updateTrip(trip: TripModel){
        
    }
    
    func deleteTrip(at indexPath:Int){
        Data.tripModels.remove(at: indexPath)
    }
}
