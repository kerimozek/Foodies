//
//  NetworkHelper.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 26.11.2022.
//

import Foundation

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Invalid URL"
    case generalError = "An Error Happened"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    let baseUrl = "https://api.spoonacular.com/recipes/"
}
