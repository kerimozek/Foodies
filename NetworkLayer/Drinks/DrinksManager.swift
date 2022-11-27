//
//  DrinksManager.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 27.11.2022.
//

import Foundation

class DrinksManager {
    
    static let shared = DrinksManager()
    
    // MARK: - MAIN BOTTOM API "https://api.spoonacular.com/recipes/random?number=12&apiKey=f77c23f74bad484cb7d04e9d5070b3dc" -
    
    let url = "\(NetworkHelper.shared.baseUrl)random?number=20&apiKey=f77c23f74bad484cb7d04e9d5070b3dc"
    
    func getDrinks(complete: @escaping((SearchRecipes?, String?)->())) {
        NetworkManager.shared.request(type: SearchRecipes.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
            case .success(let items):
                complete(items, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
}
