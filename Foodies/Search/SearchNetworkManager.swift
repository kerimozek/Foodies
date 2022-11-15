//
//  SearchNetworkManager.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 15.11.2022.
//

import Foundation

protocol SearchNetworkManagerDelegate: AnyObject {
    func didFetchData(isDone: Bool)
}


class SearchNetworkManager {
    
    weak var delegate: SearchNetworkManagerDelegate?
    static let shared = SearchNetworkManager()
    private init () { }
    
    var dinner: [Recipe] = []
    
    func fetchData() {
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        let request: URLRequest = .init(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                self.dinner = try JSONDecoder().decode([Recipe].self, from: data)
                self.dinner = self.dinner.filter{ $0.id < 31 }
                self.delegate?.didFetchData(isDone: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
