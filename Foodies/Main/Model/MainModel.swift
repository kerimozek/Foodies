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
