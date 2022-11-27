//
//  SearchModel.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 27.11.2022.
//

import Foundation

// MARK: - MainModel -

struct SearchRecipes: Codable {
    let recipes: [Search]?
}

// MARK: - MainRecipe -

struct Search: Codable, BaseModel {
    var id: Int?
    var title: String?
    var image: String?
    var readyInMinutes, servings: Int?
    var pricePerServing: Double?
    var vegetarian, vegan, glutenFree, dairyFree: Bool?
    var summary: String?
    var instructions: String?
}

