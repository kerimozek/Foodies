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
    var baseList: [BaseModel] = []
    var count = 0 {
        didSet {
            if count == 3 {
                baseListCreate()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        buttonStyle.layer.cornerRadius = 6
        buttonStyle.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        randomTableView.delegate = self
        randomTableView.dataSource = self
        randomTableView.register(.init(nibName: "RandomCell", bundle: nil), forCellReuseIdentifier: randomTableViewCell)
        RandomViewModel.shared.delegate = self
        RandomViewModel.shared.getSweetsItems{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        RandomViewModel.shared.getDinnerItems{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        RandomViewModel.shared.getDrinkItems{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
    }

    @IBAction func shuffleButtonTapped(_ sender: Any) {
        baseListCreate()
    }
    
    private func baseListCreate() {
        baseList.removeAll()
        let itemDinner = RandomViewModel.shared.dinner.shuffled().first
        let itemSweets = RandomViewModel.shared.sweets.shuffled().first
        let itemDrinks = RandomViewModel.shared.drinks.shuffled().first
     //   medetcan.append(.init(id: itemDinner?.id, title: itemDinner?.title, image: itemDinner?.image))
        baseList.append(itemDinner!)
        baseList.append(itemSweets!)
        baseList.append(itemDrinks!)
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
        return baseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = randomTableView.dequeueReusableCell(withIdentifier: randomTableViewCell, for: indexPath) as! RandomCell
        let item = baseList[indexPath.row]
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
        vc.detail = baseList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension RandomVC: RandomViewModelDelegate {
    func didGetSweets(isDone: Bool) {
        if isDone {
            count += 1
        }
    }
    func didGetDinner(isDone: Bool) {
        if isDone {
            count += 1
        }
    }
    func didGetDrinks(isDone: Bool) {
        if isDone {
            count += 1
        }
    }
}
