//
//  DrugController.swift
//  itsPETER
//
//  Created by Peter Gow on 16/8/18.
//  Copyright © 2018 SamWayne. All rights reserved.
//

import Foundation

class DrugController {
    
    static let shared = DrugController()
    
    let player = Player()
    
    // Fetch drugs and prices for location (randomised)
    func fetchDrugsForLocation() -> [Drug] {
        let drugs = Constants.allDrugs.shuffle()
        return drugs
    }
    
    // Buy a drug
    func buy(drug: Drug, totalCost: Double) -> Bool {
        if player.cash < totalCost {
            print("You're too pov.")
            return false
            // TODO: add alert controller to view controller
        } else {
            player.stash.append(drug)
            player.cash -= totalCost
            return true
        }
    }
    
    // Sell a drug
    func sell(drug: Drug, totalCost: Double) {
        
        // Add the cash to the player's wallet
        player.cash += totalCost
        
        // Remove the drug from their stash
        player.stash = player.stash.filter {$0.name != drug.name}

        if player.cash > 10000 {
            // TODO: End the game with popup
        }
    }
}



extension Array {
    /// Returns an array containing this sequence shuffled
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }
    /// Shuffles this sequence in place
    @discardableResult
    mutating func shuffle() -> Array {
        let count = self.count
        indices.lazy.dropLast().forEach {
            swapAt($0, Int(arc4random_uniform(UInt32(count - $0))) + $0)
        }
        return self
    }
    var chooseOne: Element { return self[Int(arc4random_uniform(UInt32(count)))] }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}
