//
//  NetworkManager.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 14.11.2022.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func didFetchData(isDone: Bool)
    func didGetData(isDone: Bool)
}


class MainNetworkManager {
    
    weak var delegate: NetworkManagerDelegate?
    static let shared = MainNetworkManager()
    private init () { }
    
    var breakfast: [Recipe] = []
    var sweets: [Result2] = []
    
    // MARK: - MAIN TOP API "https://api.spoonacular.com/recipes/random?number=12&apiKey=f77c23f74bad484cb7d04e9d5070b3dc" -
    
    func fetchData() {
    
        guard let url = URL.init(string: "https://api.spoonacular.com/recipes/random?number=12&apiKey=f77c23f74bad484cb7d04e9d5070b3dc") else { return }
        
            let request: URLRequest = .init(url: url)
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                
                guard let self = self else { return }
                guard error == nil else { return }
                guard let data = data else { return }
                
                do {
                    let recipeNew = try JSONDecoder().decode(SearchRecipes.self, from: data)
                    self.breakfast = recipeNew.recipes!
                    print(self.breakfast)
                    print(self.breakfast.count)
                    self.delegate?.didFetchData(isDone: true)
                } catch {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    
    // MARK: - MAIN BOTTOM API "https://api.spoonacular.com/recipes/complexSearch?apiKey=6190a837e2cd420cbf41a6b7d5a14eb6" -
    
    func getData() {
        
        guard let url = URL.init(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=6190a837e2cd420cbf41a6b7d5a14eb6") else { return }
        
        let request: URLRequest = .init(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                let recipeNew = try JSONDecoder().decode(RecipeNew.self, from: data)
                self.sweets = recipeNew.results!
                self.delegate?.didGetData(isDone: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
}




