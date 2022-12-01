//
//  DinnerManager.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 27.11.2022.
//

import Foundation

class DinnerManager {
    
    static let shared = DinnerManager()
    
    // MARK: - API "https://api.spoonacular.com/recipes/random?number=16&apiKey=f77c23f74bad484cb7d04e9d5070b3dc" -
    
    let url = "\(NetworkHelper.shared.baseUrl)random?number=16&apiKey=6190a837e2cd420cbf41a6b7d5a14eb6"
    
    func getDinner(complete: @escaping((SweetRecipes?, String?)->())) {
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
