//
//  FavoritesVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 14.11.2022.
//

import Foundation

import UIKit
import Firebase

class FavoritesVC: UIViewController {

    @IBOutlet weak var favoritesTableView: UITableView!
    let favoritesTableViewID = "favoritesTableView"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        favoritesTableView.register(.init(nibName: "FavoritesCell", bundle: nil), forCellReuseIdentifier: favoritesTableViewID)
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

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchNetworkManager.shared.dinner.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: favoritesTableViewID, for: indexPath) as! FavoritesCell
        let item = SearchNetworkManager.shared.dinner[indexPath.row]
        cell.configureCell(item: item)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.detail = SearchNetworkManager.shared.dinner[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
