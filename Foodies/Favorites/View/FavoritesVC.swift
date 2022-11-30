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
    var favoritesData = [Favorite]()
    var db = Firestore.firestore()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        getFavorites()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        favoritesData.removeAll()
    }

    private func setupUI() {
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        favoritesTableView.register(.init(nibName: "FavoritesCell", bundle: nil), forCellReuseIdentifier: favoritesTableViewID)
  }
    
    private func getFavorites() {
        db.collection("Favorites").whereField("mail", isEqualTo: Auth.auth().currentUser?.email as Any).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.counter += 1
                    let item = document.data()
                    let baseModel: Favorite = .init(id: item["id"] as? Int,
                                                    title: item["title"] as? String,
                                                    image: item["image"] as? String)
                    
                    self.favoritesData.append(baseModel)
                    // item["id"] as! Int == (self.detail?.id)!
               //       print("\(document.documentID)")
                    if self.counter == querySnapshot!.documents.count {
                        self.counter = 0
                        self.favoritesTableView.reloadData()
                    }
                }
            }
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

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: favoritesTableViewID, for: indexPath) as! FavoritesCell
        let item = favoritesData[indexPath.row]
        print(item)
        cell.configureCell(item: item)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.detail = favoritesData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

