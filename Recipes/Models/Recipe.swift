//
//  Item.swift
//  Recipes
//
//  Created by Christian Sohns on 6/26/23.
//

import Foundation
import SwiftData

@Model
final class Recipe {
    var id: UUID
    var title: String
    var shortInfo: String
    var ingredients: [Ingredient]
    var instructions: String
    var isFavorite: Bool
    
    init(title: String, shortInfo: String, ingredients: [Ingredient], instructions: String) {
        self.id = UUID()
        self.title = title
        self.shortInfo = shortInfo
        self.ingredients = ingredients
        self.instructions = instructions
        self.isFavorite = false
    }
}

@Model
final class Ingredient {
    var name: String
    var amount: String
    
    init(name: String, amount: String) {
        self.name = name
        self.amount = amount
    }
}
