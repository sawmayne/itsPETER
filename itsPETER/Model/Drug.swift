//
//  Drug.swift
//  itsPETER
//
//  Created by Peter Gow on 16/8/18.
//  Copyright © 2018 SamWayne. All rights reserved.
//

import Foundation

class Drug {
    
    let name: String
    var amount: Double
    var price: Double
    
    init(name: String, amount: Double = 1.0, price: Double = 10.0) {
        self.name = name
        self.amount = amount
        self.price = price
    }
}
