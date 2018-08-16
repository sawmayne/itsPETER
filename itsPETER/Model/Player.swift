//
//  Player.swift
//  itsPETER
//
//  Created by Peter Gow on 16/8/18.
//  Copyright © 2018 SamWayne. All rights reserved.
//

import Foundation

class Player {
    
    var cash: Double
    var time: TimeInterval
    var stash: [Drug]
    
    init(cash: Double = 2000.0,
         time: TimeInterval = 600,
         stash: [Drug] = [Drug(name: "Acid", amount: 0, price: 0),
                          Drug(name: "Coke", amount: 0, price: 0),
                          Drug(name: "Heroin", amount: 0, price: 0),
                          Drug(name: "Pingas", amount: 0, price: 0),
                          Drug(name: "Weed", amount: 0, price: 0)]) {
        
        

        self.cash = cash
        self.time = time
        self.stash = stash
    }
}


