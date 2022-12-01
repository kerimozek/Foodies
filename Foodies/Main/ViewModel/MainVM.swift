//
//  MainVM.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 27.11.2022.
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
    func didGetSweets(isDone: Bool)
    func didGetDinner(isDone: Bool)
}

class MainViewModel {
    
    weak var delegate: MainViewModelDelegate?
    static let shared = MainViewModel()
    private init () { }
    
    var sweets: [Sweets] = []
    var dinner: [Sweets] = []

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
}
