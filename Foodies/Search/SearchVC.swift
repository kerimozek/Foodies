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
    let searchController = UISearchController(searchResultsController: nil)
    var searchedData: [Recipe] = []
    var searching = false
    
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
        configureSearchController()
        
    }
    
    private func configureSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search For Dinner.."
  
    }
    
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedData.count
        } else {
            return SearchNetworkManager.shared.dinner.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: searchCell, for: indexPath) as! SearchCell
        if searching {
            let item = searchedData[indexPath.row]
            cell.configureCell(item: item)
        } else {
            let item = SearchNetworkManager.shared.dinner[indexPath.row]
            cell.configureCell(item: item)
        }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        230
    }
}

extension SearchVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
            searchedData.removeAll()
            for resultData in SearchNetworkManager.shared.dinner {
                if resultData.title!.lowercased().contains(searchText.lowercased()) {
                    searchedData.append(resultData)
                }
            }
        } else {
            searching = false
            searchedData.removeAll()
            searchedData = SearchNetworkManager.shared.dinner
        }
        searchTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedData.removeAll()
        searchTableView.reloadData()
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
