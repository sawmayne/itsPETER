//
//  ViewController.swift
//  itsPETER
//
//  Created by Sam on 8/15/18.
//  Copyright © 2018 SamWayne. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: Variables
    var drugs: [Drug] = []
    var timer: Timer?
    var timeLeft = 300
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.drugs = DrugController.shared.fetchDrugsForLocation()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        startGameAlert()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        timer?.tolerance = 0.1
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cashLabel.text = "$\(DrugController.shared.player.cash)"
    }
    
    @IBAction func locationButtonTapped(_ sender: UIButton) {
        self.drugs = DrugController.shared.fetchDrugsForLocation()
        tableView.reloadData()
    }
    
    // MARK: TableView Delegate Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drugs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drugCell", for: indexPath)
        
        let drug = drugs[indexPath.row]
        
        cell.textLabel?.text = drug.name
        cell.detailTextLabel?.text = String(drug.price)
        cell.imageView?.image = UIImage(named: drug.name)
        
        return cell
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "buyDrugs" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? BuyDrugsViewController else { return }
            
            destinationVC.drug = drugs[indexPath.row]
            
        }
    }
    
    // MARK: Alerts
    func endGameAlert() {
        let alertController = UIAlertController(title: "You dead", message: "No dice, stick to accounting.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Go to my funeral", style: .default) { (_) in
            fatalError()
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    func startGameAlert() {
        let alertController = UIAlertController(title: "Welcome to Salt Lake", message: "You've got 5 minutes to get me 5 grand.", preferredStyle: .alert)
        
        let startAction = UIAlertAction(title: "Start dealing", style: .default) { (_) in

        }
        
        alertController.addAction(startAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    // MARK: Timer helpers
    @objc func fireTimer() {
        timeLeft -= 1
        self.timeLabel.text = timeString(time: timeLeft)
        
        if timeLeft == 0 {
            timer!.invalidate()
            endGameAlert()
        }
    }
    
    func timeString(time: Int) -> String {
        let timeLeftSeconds = time % 60
        let timeLeftMinutes = time / 60
        return String(format: "%02d : %02d", timeLeftMinutes, timeLeftSeconds)
    }
}










