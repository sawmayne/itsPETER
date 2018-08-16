//
//  DrugController.swift
//  itsPETER
//
//  Created by Peter Gow on 16/8/18.
//  Copyright © 2018 SamWayne. All rights reserved.
//

import UIKit

class DrugController {
    
    static let shared = DrugController()
    
    let player = Player()
    
    // Fetch drugs and prices for location (randomised)
    func fetchDrugsForLocation() -> [Drug] {
        var drugs = Constants.allDrugs()
        return drugs.shuffle()
    }
    
    // Buy a drug
    func buy(drug: Drug, amount: Double, totalCost: Double) {
        if player.cash < totalCost {
            print("You're too pov.")
        } else {
            
            let name = drug.name
            if let playerDrug = DrugController.shared.player.stash.first(where: {$0.name == name }) {
                playerDrug.amount += amount
            } else {
                print("Drug buy failed")
            }
            
            player.cash -= totalCost
        }
    }
    
    // Sell a drug
    func sell(drug: Drug, totalCost: Double) {
        
        // Add the cash to the player's wallet
        player.cash += totalCost
        
        // Remove the drug from their stash
        let name = drug.name
        if let playerDrug = DrugController.shared.player.stash.first(where: {$0.name == name }) {
            playerDrug.amount = 0
        } else {
            print("Drug buy failed")
        }

        if player.cash > 5000 {
            winGameAlert()
        }
    }
    
    // Win like a big dog
    func winGameAlert() {
        let alertController = UIAlertController(title: "About time", message: "You win. Now go get me another 5 grand.", preferredStyle: .alert)
        
        let startAction = UIAlertAction(title: "Spend winnings on coke", style: .default) { (_) in
            fatalError()
        }
        
        alertController.addAction(startAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }
}

// Helper to shuffle the drugs array in the table view
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
