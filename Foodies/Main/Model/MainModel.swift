//
//  MainModel.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 27.11.2022.
//

import Foundation

// MARK: - MainModel -

struct SweetRecipes: Codable {
    let recipes: [Sweets]?
}

// MARK: - MainRecipe -

struct Sweets: Codable, BaseModel {
    var id: Int?
    var title: String?
    var image: String?
    var readyInMinutes, servings: Int?
    var pricePerServing: Double?
    var vegetarian, vegan, glutenFree, dairyFree: Bool?
    var summary: String?
    var instructions: String?
}


// MARK: - MainModel -
struct DinnerRecipe: Codable {
    let results: [Dinner]?
}

struct Dinner: Codable, BaseModel {
    var id: Int?
    var title: String?
    var image: String?
    var readyInMinutes: Int?
    var servings: Int?
    var pricePerServing: Double?
    var vegan: Int?
    var glutenFree: String?
    var summary: String?
    var instructions: String?
    var vegetarian: String?

}
