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
    var ingredients: [String]
    var instructions: String
    var isFavorite: Bool
    
    init(title: String, shortInfo: String, instructions: String) {
        self.id = UUID()
        self.title = title
        self.shortInfo = shortInfo
        self.ingredients = []
        self.instructions = instructions
        self.isFavorite = false
    }
    
    func add(ingredient: String) -> Void {
        self.ingredients.append(ingredient)
    }
    
    func remove(ingredient: String) -> Void {
        let index = self.ingredients.firstIndex(of: ingredient)
        if index == -1 {
            return
        }
        
        self.ingredients.remove(at: index!)
    }
}
