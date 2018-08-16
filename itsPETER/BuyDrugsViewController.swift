//
//  BuyDrugsViewController.swift
//  itsPETER
//
//  Created by Peter Gow on 17/8/18.
//  Copyright © 2018 SamWayne. All rights reserved.
//

import UIKit

class BuyDrugsViewController: UIViewController {
    
    @IBOutlet weak var drugNameLabel: UILabel!
    @IBOutlet weak var drugPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var amountEntryTextField: UITextField!
    
    var drug: Drug?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let drug = drug else { return }
        
        let name = drug.name
        if let playerDrug = DrugController.shared.player.stash.first(where: {$0.name == name }) {
            amountEntryTextField.text = "\(playerDrug.amount)"
        } else {
            amountEntryTextField.text = ""
        }

        drugNameLabel.text = drug.name
        drugPriceLabel.text = "\(drug.price)"
        
    }

    @IBAction func buyButtontapped(_ sender: UIButton) {
        if amountEntryTextField.text != "" {
            let amount = (amountEntryTextField.text as NSString?)?.doubleValue
            let price = (drugPriceLabel.text as NSString?)?.doubleValue
            
            DrugController.shared.buy(drug: self.drug!, amount: amount!, totalCost: amount! * price!)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sellButtonTapped(_ sender: UIButton) {
        if amountEntryTextField.text != "" {
            let amount = (amountEntryTextField.text as NSString?)?.doubleValue
            let price = (drugPriceLabel.text as NSString?)?.doubleValue
            
            DrugController.shared.sell(drug: self.drug!, totalCost: amount! * price!)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    

}
