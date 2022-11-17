// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipes = try? newJSONDecoder().decode(Recipes.self, from: jsonData)

import Foundation

// MARK: - Recipe
struct FakeData: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}


// MARK: - MainModel -
struct RecipeNew: Codable {
    let results: [Result]?
}

struct Result: Codable {
    let id: Int?
    let title: String?
    let image: String?
}


// MARK: - SearchModel -

struct SearchRecipes: Codable {
    let recipes: [Recipe]?
}

// MARK: - Recipe
struct Recipe: Codable {
    let id: Int?
    let title: String?
    let image: String?

}


