//
//  Constants.swift
//  itsPETER
//
//  Created by Peter Gow on 16/8/18.
//  Copyright © 2018 SamWayne. All rights reserved.
//

import Foundation

struct Constants {
    
    static var allDrugs = [
        Drug(name: "Acid", amount: drugDouble(), price: drugDouble()),
        Drug(name: "Coke", amount: drugDouble(), price: drugDouble()),
        Drug(name: "Heroin", amount: drugDouble(), price: drugDouble()),
        Drug(name: "Pingas", amount: drugDouble(), price: drugDouble()),
        Drug(name: "Weed", amount: drugDouble(), price: drugDouble())
    ]
    
    static func drugDouble() -> Double {
        let randomDouble = drand48()
        let biggerRandomDouble = randomDouble*100
        let roundedDouble = (biggerRandomDouble*100).rounded()/100
        return roundedDouble
    }
}

