//
//  RandomNetworkManager.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 15.11.2022.
//

import Foundation

protocol RandomNetworkManagerDelegate: AnyObject {
    func getBreakfastData(isDone: Bool)
    func getSweetsData(isDone: Bool)
    func getDinnerData(isDone: Bool)
}


class RandomNetworkManager {
    
    weak var delegate: RandomNetworkManagerDelegate?
    static let shared = RandomNetworkManager()
    private init () { }
    
    var breakfast: [Recipe] = []
    var sweets: [Recipe] = []
    var dinner: [Recipe] = []
    
    
    // MARK: - MAIN TOP API "https://api.spoonacular.com/recipes/random?number=12&apiKey=f77c23f74bad484cb7d04e9d5070b3dc" -
    
    func getBreakfast() {
    
        guard let url = URL.init(string: "https://api.spoonacular.com/recipes/random?number=12&apiKey=f77c23f74bad484cb7d04e9d5070b3dc") else { return }
        
            let request: URLRequest = .init(url: url)
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                
                guard let self = self else { return }
                guard error == nil else { return }
                guard let data = data else { return }
                
                do {
                    let recipeNew = try JSONDecoder().decode(SearchRecipes.self, from: data)
                    self.breakfast = recipeNew.recipes!
                    self.delegate?.getBreakfastData(isDone: true)
                } catch {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    
    // MARK: - MAIN BOTTOM API "https://api.spoonacular.com/recipes/complexSearch?apiKey=6190a837e2cd420cbf41a6b7d5a14eb6" -

    func getSweets() {

        guard let url = URL.init(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=6190a837e2cd420cbf41a6b7d5a14eb6") else { return }

        let request: URLRequest = .init(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else { return }

            do {
                let recipeNew = try JSONDecoder().decode(RecipeNew.self, from: data)
             //   self.sweets = recipeNew.recipes!
                self.sweets = recipeNew.results!.map { Recipe(id: $0.id, title: $0.title, image: $0.image) }
                self.delegate?.getSweetsData(isDone: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    // MARK: - SEARCH API "https://api.spoonacular.com/recipes/random?number=12&apiKey=449638e882654e5e91b70bd45ab1b9f6" -

    func getDinner() {

        guard let url = URL.init(string: "https://api.spoonacular.com/recipes/random?number=12&apiKey=449638e882654e5e91b70bd45ab1b9f6") else { return }

        let request: URLRequest = .init(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else { return }

            do {
                let recipeNew = try JSONDecoder().decode(SearchRecipes.self, from: data)
                self.dinner = recipeNew.recipes!
                self.delegate?.getDinnerData(isDone: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    
}
