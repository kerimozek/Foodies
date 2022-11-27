//
//  SearchVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 14.11.2022.
//

import UIKit
import Firebase

class SearchVC: UIViewController {
   

    @IBOutlet weak var searchTableView: UITableView!
    let searchCell = "SearchCell"
    let searchController = UISearchController(searchResultsController: nil)
    var searchedData: [Search] = []
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    private func setupUI() {
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(.init(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: searchCell)
        SearchViewModel.shared.delegate = self
        
        SearchViewModel.shared.getSweetsItems{ errorMessage in
            if let errorMessage = errorMessage {
                print("error \(errorMessage)")
            }
        }
        configureSearchController()
        searchTableView.reloadData()
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

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedData.count
        } else {
            return SearchViewModel.shared.drinks.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: searchCell, for: indexPath) as! SearchCell
        if searching {
            let item = searchedData[indexPath.row]
            cell.configureCell(item: item)
        } else {
            let item = SearchViewModel.shared.drinks[indexPath.row]
            cell.configureCell(item: item)
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        vc.detail = SearchViewModel.shared.drinks[indexPath.row]
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
            for resultData in SearchViewModel.shared.drinks {
                if resultData.title!.lowercased().contains(searchText.lowercased()) {
                    searchedData.append(resultData)
                }
            }
        } else {
            searching = false
            searchedData.removeAll()
            searchedData = SearchViewModel.shared.drinks
        }
        searchTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedData.removeAll()
        searchTableView.reloadData()
    }
}

extension SearchVC: SearchViewModelDelegate {
    func didGetDrinks(isDone: Bool) {
        if isDone {
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
            }
        }
    }
}
