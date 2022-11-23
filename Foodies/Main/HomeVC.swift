//
//  ViewController.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 13.11.2022.
//

import UIKit
import Firebase

class HomeVC: UIViewController {


    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    let topCollectionViewID = "topCollectionViewCell"
    let bottomCollectionViewID = "bottomCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        bottomCollectionView.delegate = self
        bottomCollectionView.dataSource = self
        self.view.addSubview(topCollectionView)
        self.view.addSubview(bottomCollectionView)
        topCollectionView.register(.init(nibName: "TopCell", bundle: nil), forCellWithReuseIdentifier: topCollectionViewID)
        bottomCollectionView.register(.init(nibName: "BottomCell", bundle: nil), forCellWithReuseIdentifier: bottomCollectionViewID)
        MainNetworkManager.shared.delegate = self
        MainNetworkManager.shared.fetchData()
        MainNetworkManager.shared.getData()
        
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

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.topCollectionView {
            return MainNetworkManager.shared.breakfast.count
            }

        return MainNetworkManager.shared.sweets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.topCollectionView {
            
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: topCollectionViewID, for: indexPath) as! TopCell
            
            let item = MainNetworkManager.shared.breakfast[indexPath.item]
            cellA.configureCell(item: item)
            cellA.backgroundColor = UIColor.clear
            return cellA
        } else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCollectionViewID, for: indexPath) as! BottomCell
        
            let item = MainNetworkManager.shared.sweets[indexPath.item]
            cellB.configureCell(item: item)
            cellB.backgroundColor = UIColor.clear
            return cellB
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        if collectionView == self.topCollectionView {
            vc.detail = MainNetworkManager.shared.breakfast[indexPath.item]
        } else {
            vc.detail = MainNetworkManager.shared.sweets[indexPath.item]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.topCollectionView {
            return CGSize(width: collectionView.frame.width / 1.5 , height: collectionView.frame.height)
        } else {
            return CGSize(width: (collectionView.frame.width + 40) / 2.5 , height: (collectionView.frame.height + 30) / 1.8)
        }
        
    }
}

extension HomeVC: NetworkManagerDelegate {
    func didFetchData(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.topCollectionView.reloadData()
            }
        }
    }
 
    func didGetData(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.bottomCollectionView.reloadData()
            }
        }
    }
}
