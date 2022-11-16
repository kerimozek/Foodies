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


class NetworkManager {
    
    weak var delegate: NetworkManagerDelegate?
    static let shared = NetworkManager()
    private init () { }
    
    var photos: [Recipe] = []
    var sweets: [Result] = []
    
    func fetchData() {
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        let request: URLRequest = .init(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                self.photos = try JSONDecoder().decode([Recipe].self, from: data)
                self.photos = self.photos.filter{ $0.id < 31 }
                self.delegate?.didFetchData(isDone: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getData() {
        
        guard let url = URL.init(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=6190a837e2cd420cbf41a6b7d5a14eb6") else { return }
        
        let request: URLRequest = .init(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                print("lollik")
                let recipeNew = try JSONDecoder().decode(RecipeNew.self, from: data)
                self.sweets = recipeNew.results!
                print(self.sweets)
                self.delegate?.didGetData(isDone: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
}




