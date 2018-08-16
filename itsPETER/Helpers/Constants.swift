//
//  Constants.swift
//  itsPETER
//
//  Created by Peter Gow on 16/8/18.
//  Copyright © 2018 SamWayne. All rights reserved.
//

import Foundation

struct Constants {
    
    static var allDrugs = {
        
        [
        Drug(name: "Acid", amount: drugDouble(), price: drugDouble()),
        Drug(name: "Coke", amount: drugDouble(), price: drugDouble()),
        Drug(name: "Heroin", amount: drugDouble(), price: drugDouble()),
        Drug(name: "Pingas", amount: drugDouble(), price: drugDouble()),
        Drug(name: "Weed", amount: drugDouble(), price: drugDouble())
    ]
        
    }
    
    static func drugDouble() -> Double {
        let randomNumber = arc4random_uniform(10000) + 1000
        let randomDouble = Double(randomNumber)
        let result = randomDouble / 100
        return result
    }
    
}


