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
    
    class func createTrip(trip: TripModel){
        
    }
    
    class func readTrips(){
        if Data.tripModels.count == 0 {
            Data.tripModels.append(TripModel(title: "Trip to Bali!"))
            Data.tripModels.append(TripModel(title: "Mexico"))
            Data.tripModels.append(TripModel(title: "Russian Trip"))
        }
    }
    
    
    class func updateTrip(trip: TripModel){
        
    }
    
    class func deleteTrip(trip: TripModel){
        
    }
}
