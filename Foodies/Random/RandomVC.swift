//
//  RandomVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 15.11.2022.
//

import UIKit

class RandomVC: UIViewController {

    
    @IBOutlet weak var randomTableView: UITableView!
    @IBOutlet weak var buttonStyle: UIButton!
    let randomTableViewCell = "randomTableViewCell"
    var medetcan: [Recipe] = []
    var count = 0 {
        didSet {
            if count == 3 {
                sametcan()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        buttonStyle.layer.cornerRadius = 6
        randomTableView.delegate = self
        randomTableView.dataSource = self
        randomTableView.register(.init(nibName: "RandomCell", bundle: nil), forCellReuseIdentifier: randomTableViewCell)
        RandomNetworkManager.shared.delegate = self
        RandomNetworkManager.shared.getDinnerData()
        RandomNetworkManager.shared.getDrinkData()
        RandomNetworkManager.shared.getSweetData()
    }

    @IBAction func shuffleButtonTapped(_ sender: Any) {
        sametcan()
    }
    
    private func sametcan() {
        medetcan.removeAll()
        let itemDinner = RandomNetworkManager.shared.dinner.shuffled().first
        let itemSweet = RandomNetworkManager.shared.sweets.shuffled().first
        let itemDrink = RandomNetworkManager.shared.drink.shuffled().first
        medetcan.append(itemDinner!)
        medetcan.append(itemSweet!)
        medetcan.append(itemDrink!)
        DispatchQueue.main.async {
            self.randomTableView.reloadData()
        }
    }
    
}

extension RandomVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medetcan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = randomTableView.dequeueReusableCell(withIdentifier: randomTableViewCell, for: indexPath) as! RandomCell
        let item = medetcan[indexPath.row]
        cell.configureCell(item: item)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    }
    
}

extension RandomVC: RandomNetworkManagerDelegate {
    
    func getDinnerData(isDone: Bool) {
        if isDone {
            count += 1
        }
    }
    
    func getSweetData(isDone: Bool) {
        if isDone {
            count += 1
        }
    }
    
    func getDrinkData(isDone: Bool) {
        if isDone {
            count += 1
        }
    }

}
