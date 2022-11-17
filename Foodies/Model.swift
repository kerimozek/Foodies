// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipes = try? newJSONDecoder().decode(Recipes.self, from: jsonData)

import Foundation

protocol BaseModel {
    var id: Int? { get set }
    var title: String? { get set }
    var image: String? { get set }
}

// MARK: - MainModel -
struct RecipeNew: Codable {
    let results: [Result]?
}

struct Result: Codable, BaseModel {
    var id: Int?
    var title: String?
    var image: String?
}


// MARK: - SearchModel -

struct SearchRecipes: Codable {
    let recipes: [Recipe]?
}

// MARK: - Recipe
struct Recipe: Codable, BaseModel {
    var id: Int?
    var title: String?
    var image: String?

}

// MARK: - RandomModel -

struct Random: BaseModel {
    var id: Int?
    var title: String?
    var image: String?
}
