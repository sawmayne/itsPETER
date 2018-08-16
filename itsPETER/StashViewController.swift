//
//  StashViewController.swift
//  itsPETER
//
//  Created by Peter Gow on 17/8/18.
//  Copyright © 2018 SamWayne. All rights reserved.
//

import UIKit

class StashViewController: UIViewController {

    @IBOutlet weak var acidLabel: UILabel!
    @IBOutlet weak var cokeLabel: UILabel!
    @IBOutlet weak var heroinLabel: UILabel!
    @IBOutlet weak var pingasLabel: UILabel!
    @IBOutlet weak var weedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    func updateViews() {
        acidLabel.text = "\(DrugController.shared.player.stash[0].amount)"
        cokeLabel.text = "\(DrugController.shared.player.stash[1].amount)"
        heroinLabel.text = "\(DrugController.shared.player.stash[2].amount)"
        pingasLabel.text = "\(DrugController.shared.player.stash[3].amount)"
        weedLabel.text = "\(DrugController.shared.player.stash[4].amount)"
    }
    

}
