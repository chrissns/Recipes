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
    var title: String
    var shortInfo: String
    var ingredients: [Ingredient]
    var instructions: String
    
    init(title: String, shortInfo: String, ingredients: [Ingredient], instructions: String) {
        self.title = title
        self.shortInfo = shortInfo
        self.ingredients = ingredients
        self.instructions = instructions
    }
}

@Model
final class Ingredient {
    var name: String
    var amount: String
}
