//
//  RandomVM.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 27.11.2022.
//

import Foundation

protocol RandomViewModelDelegate: AnyObject {
    func didGetSweets(isDone: Bool)
    func didGetDinner(isDone: Bool)
    func didGetDrinks(isDone: Bool)
}

class RandomViewModel {
    
    weak var delegate: RandomViewModelDelegate?
    static let shared = RandomViewModel()
    private init () { }
    
    var sweets: [Sweets] = []
    var dinner: [Sweets] = []
    var drinks: [Search] = []

    func getSweetsItems(complete: @escaping((String?)->())) {
        SweetsManager.shared.getSweets { items, errorMessage in
            
            if let items = items {
                self.sweets = items.recipes!
                self.delegate?.didGetSweets(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetSweets(isDone: false)
        }
    }
  
    func getDinnerItems(complete: @escaping((String?)->())) {
        DinnerManager.shared.getDinner { items, errorMessage in
            
            if let items = items {
                self.dinner = items.recipes!
                self.delegate?.didGetDinner(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetDinner(isDone: false)
        }
    }
    
    func getDrinkItems(complete: @escaping((String?)->())) {
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
