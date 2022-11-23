//
//  RandomVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 15.11.2022.
//

import UIKit
import Firebase

class RandomVC: UIViewController {

    
    @IBOutlet weak var randomTableView: UITableView!
    @IBOutlet weak var buttonStyle: UIButton!
    let randomTableViewCell = "randomTableViewCell"
    var medetcan: [BaseModel] = []
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
        RandomNetworkManager.shared.getBreakfast()
        RandomNetworkManager.shared.getDinner()
        RandomNetworkManager.shared.getSweets()
    }

    @IBAction func shuffleButtonTapped(_ sender: Any) {
        sametcan()
    }
    
    private func sametcan() {
        medetcan.removeAll()
        let itemDinner = RandomNetworkManager.shared.dinner.shuffled().first
        let itemSweet = RandomNetworkManager.shared.sweets.shuffled().first
        let itemDrink = RandomNetworkManager.shared.breakfast.shuffled().first
     //   medetcan.append(.init(id: itemDinner?.id, title: itemDinner?.title, image: itemDinner?.image))
        medetcan.append(itemDinner!)
        medetcan.append(itemSweet!)
        medetcan.append(itemDrink!)
        DispatchQueue.main.async {
            self.randomTableView.reloadData()
        }
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let board = UIStoryboard(name: "Main", bundle: nil)
            let navBar = board.instantiateViewController(withIdentifier: "loginNavBar")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(navBar)
        } catch {
            print(error.localizedDescription)
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.detail = medetcan[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        print("clicked")
    }
    
}

extension RandomVC: RandomNetworkManagerDelegate {
    func getDinnerData(isDone: Bool) {
        if isDone {
            count += 1
        }
    }
    func getSweetsData(isDone: Bool) {
        if isDone {
            count += 1
        }
    }
    func getBreakfastData(isDone: Bool) {
        if isDone {
            count += 1
        }
    }
}
