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
}
