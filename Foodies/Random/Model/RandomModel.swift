//
//  RandomModel.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 27.11.2022.
//

import Foundation

protocol BaseModel {
    var id: Int? { get set }
    var title: String? { get set }
    var image: String? { get set }
    var readyInMinutes: Int? { get set }
    var servings: Int? { get set }
    var summary: String? { get set }
    var pricePerServing: Double? { get set }
    var vegan: Bool? { get set }
    var idList: [String] { get set }
}

//// MARK: - MainModel -
//
//struct RandomSweetRecipes: Codable {
//    let recipes: [RandomSweets]?
//}
//
//// MARK: - MainRecipe -
//
//struct RandomSweets: Codable, BaseModel {
//    var id: Int?
//    var title: String?
//    var image: String?
//    var readyInMinutes, servings: Int?
//    var pricePerServing: Double?
//    var vegetarian, vegan, glutenFree, dairyFree: Bool?
//    var summary: String?
//    var instructions: String?
//}
//
//
//// MARK: - MainModel -
//struct RandomDinnerRecipe: Codable {
//    let results: [RandomDinner]?
//}
//
//struct RandomDinner: Codable, BaseModel {
//    var id: Int?
//    var title: String?
//    var image: String?
//    var readyInMinutes: Int?
//    var servings: Int?
//    var pricePerServing: Double?
//    var vegan: Int?
//    var glutenFree: String?
//    var summary: String?
//    var instructions: String?
//    var vegetarian: String?
//}
//
//// MARK: - MainModel -
//
//struct RandomSearchRecipes: Codable {
//    let recipes: [RandomSearch]?
//}
//
//// MARK: - MainRecipe -
//
//struct RandomSearch: Codable, BaseModel {
//    var id: Int?
//    var title: String?
//    var image: String?
//    var readyInMinutes, servings: Int?
//    var pricePerServing: Double?
//    var vegetarian, vegan, glutenFree, dairyFree: Bool?
//    var summary: String?
//    var instructions: String?
//}
