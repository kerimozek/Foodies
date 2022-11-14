//
//  FavoritesVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 14.11.2022.
//

import Foundation

import UIKit

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
}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: favoritesTableViewID, for: indexPath)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    }
}
