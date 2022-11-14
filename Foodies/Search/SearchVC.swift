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
        
    }
    
    @IBAction func searchField(_ sender: Any) {
        
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: searchCell, for: indexPath)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    }
}
