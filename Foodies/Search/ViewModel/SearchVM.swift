//
//  SearchVM.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 27.11.2022.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func didGetDrinks(isDone: Bool)
}

class SearchViewModel {
    
    weak var delegate: SearchViewModelDelegate?
    static let shared = SearchViewModel()
    private init () { }
    
    var drinks: [Search] = []

    func getSweetsItems(complete: @escaping((String?)->())) {
        DrinksManager.shared.getDrinks { items, errorMessage in
            
            if let items = items {
                self.drinks = items.recipes!
                self.delegate?.didGetDrinks(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetDrinks(isDone: false)
        }
    }
}
