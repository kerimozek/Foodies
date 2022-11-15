//
//  ViewController.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 13.11.2022.
//

import UIKit

class HomeVC: UIViewController {


    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    let topCollectionViewID = "topCollectionViewCell"
    let bottomCollectionViewID = "bottomCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        NetworkManager.shared.delegate = self
        NetworkManager.shared.fetchData()
        NetworkManager.shared.getData()
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
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.topCollectionView {
            return NetworkManager.shared.sweets.count // Replace with count of your data for topCollectionView
            }

        return NetworkManager.shared.photos.count // Replace with count of your data for bottomCollectionViewID
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.topCollectionView {
            
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: topCollectionViewID, for: indexPath) as! TopCell
            
            let item = NetworkManager.shared.sweets[indexPath.row]
            cellA.configureCell(item: item)
            cellA.backgroundColor = UIColor.clear
            return cellA
        } else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCollectionViewID, for: indexPath) as! BottomCell
            
            let item = NetworkManager.shared.photos[indexPath.row]
            cellB.configureCell(item: item)
            cellB.backgroundColor = UIColor.clear
            return cellB
        }
        
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
                self.bottomCollectionView.reloadData()
            }
        }
    }

    
    func didGetData(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.topCollectionView.reloadData()
            }
        }
    }
}
