//
//  TripFunction.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 12/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import Foundation


class TripFunction{
    
    static var shared = TripFunction()
    
    func createTrip(trip: TripModel){
        Data.tripModels.append(trip)
    }
    
    func readTrips(completion:@escaping () -> ()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Bali!"))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Russian Trip"))
            }
        }
        
        DispatchQueue.main.async {
            completion()
        }
        
    }
    
    
    func updateTrip(trip: TripModel){
        
    }
    
    func deleteTrip(trip: TripModel){
        
    }
}
