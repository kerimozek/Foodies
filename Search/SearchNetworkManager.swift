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
    
    // MARK: - SEARCH API "https://api.spoonacular.com/recipes/random?number=12&apiKey=449638e882654e5e91b70bd45ab1b9f6" -
    
    func fetchData() {
        
        guard let url = URL.init(string: "https://api.spoonacular.com/recipes/random?number=12&apiKey=449638e882654e5e91b70bd45ab1b9f6") else { return }
        
        let request: URLRequest = .init(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                let recipeNew = try JSONDecoder().decode(SearchRecipes.self, from: data)
                self.dinner = recipeNew.recipes!
                self.delegate?.didFetchData(isDone: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
