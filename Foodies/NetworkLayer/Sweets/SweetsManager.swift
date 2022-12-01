//
//  SweetsManager.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 27.11.2022.
//

import Foundation

class SweetsManager {
    
    static let shared = SweetsManager()
    
    // MARK: - API "https://api.spoonacular.com/recipes/random?number=16&apiKey=6190a837e2cd420cbf41a6b7d5a14eb6" -
    
    let url = "\(NetworkHelper.shared.baseUrl)random?number=16&apiKey=6190a837e2cd420cbf41a6b7d5a14eb6"
    
    func getSweets(complete: @escaping((SweetRecipes?, String?)->())) {
        NetworkManager.shared.request(type: SweetRecipes.self,
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

