//
//  FavoritesModel.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 27.11.2022.
//

import Foundation

// MARK: - FavoritesModel -

struct FavoritesRecipes: Codable {
    let recipes: [Favorites]?
}

// MARK: - FavoritesRecipe -

struct Favorites: Codable, BaseModel {
    var id: Int?
    var title: String?
    var image: String?
    var readyInMinutes, servings: Int?
    var pricePerServing: Double?
    var vegetarian, vegan, glutenFree, dairyFree: Bool?
    var summary: String?
    var instructions: String?
}
