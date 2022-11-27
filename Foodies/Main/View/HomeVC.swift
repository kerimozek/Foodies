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
        MainViewModel.shared.delegate = self
        
        MainViewModel.shared.getSweetsItems{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        
        MainViewModel.shared.getDinnerItems{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
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

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.topCollectionView {
            return MainViewModel.shared.sweets.count
            }

        return MainViewModel.shared.dinner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.topCollectionView {
            
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: topCollectionViewID, for: indexPath) as! TopCell
            
            let item = MainViewModel.shared.sweets[indexPath.item]
            cellA.configureCell(item: item)
            cellA.backgroundColor = UIColor.clear
            return cellA
        } else {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCollectionViewID, for: indexPath) as! BottomCell
        
            let item = MainViewModel.shared.dinner[indexPath.item]
            cellB.configureCell(item: item)
            cellB.backgroundColor = UIColor.clear
            return cellB
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        if collectionView == self.topCollectionView {
            vc.detail = MainViewModel.shared.sweets[indexPath.item]
        } else {
            vc.detail = MainViewModel.shared.dinner[indexPath.item]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.topCollectionView {
            return CGSize(width: collectionView.frame.width / 1.5 , height: collectionView.frame.height)
        } else {
            return CGSize(width: (collectionView.frame.width + 60 ) / 2.5 , height: (collectionView.frame.height + 30) / 1.8)
        }
        
    }
}

extension HomeVC: MainViewModelDelegate {
    func didGetSweets(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.topCollectionView.reloadData()
            }
        }
    }
 
    func didGetDinner(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.bottomCollectionView.reloadData()
            }
        }
    }
}
