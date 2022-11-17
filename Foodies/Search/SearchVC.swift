//
//  SearchVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 14.11.2022.
//

import UIKit

class SearchVC: UIViewController {


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchTableView: UITableView!
    let searchCell = "SearchCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    private func setupUI() {
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(.init(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: searchCell)
        SearchNetworkManager.shared.delegate = self
        SearchNetworkManager.shared.fetchData()
        
    }
    
    @IBAction func searchField(_ sender: Any) {
        
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchNetworkManager.shared.dinner.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: searchCell, for: indexPath) as! SearchCell
        let item = SearchNetworkManager.shared.dinner[indexPath.row]
        cell.configureCell(item: item)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    }
}


extension SearchVC: SearchNetworkManagerDelegate {
    func didFetchData(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        }
    }
}
