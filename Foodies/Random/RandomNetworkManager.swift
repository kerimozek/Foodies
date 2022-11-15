//
//  RandomNetworkManager.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 15.11.2022.
//

import Foundation

protocol RandomNetworkManagerDelegate: AnyObject {
    func getDinnerData(isDone: Bool)
    func getSweetData(isDone: Bool)
    func getDrinkData(isDone: Bool)
}


class RandomNetworkManager {
    
    weak var delegate: RandomNetworkManagerDelegate?
    static let shared = RandomNetworkManager()
    private init () { }
    
    var dinner: [Recipe] = []
    var sweets: [Recipe] = []
    var drink: [Recipe] = []
    
    func getDinnerData() {
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        let request: URLRequest = .init(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                self.dinner = try JSONDecoder().decode([Recipe].self, from: data)
                self.dinner = self.dinner.filter{ $0.id < 31 }
                self.delegate?.getDinnerData(isDone: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getSweetData() {
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        let request: URLRequest = .init(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                self.sweets = try JSONDecoder().decode([Recipe].self, from: data)
                self.sweets = self.sweets.filter{ $0.id < 31 }
                self.delegate?.getSweetData(isDone: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getDrinkData() {
        
        guard let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        let request: URLRequest = .init(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            guard let self = self else { return }
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                self.drink = try JSONDecoder().decode([Recipe].self, from: data)
                self.drink = self.drink.filter{ $0.id > 4969 }
                self.delegate?.getDrinkData(isDone: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
}
