//
//  NetworkManager.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 26.11.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type, url: String, method: HttpMethods, completion: @escaping((Result<T, ErrorTypes>)->())) {
        
        
    }
    
}
