//
//  Item.swift
//  Recipes
//
//  Created by Christian Sohns on 6/26/23.
//

import Foundation
import SwiftData

@Model
class Recipe {
    var title: String
    var shortInfo: String
    var tags: [String]
    var ingredients: [String]
    var instructions: String
    var isFavorite: Bool
    
    init(title: String, shortInfo: String, tags: [String], instructions: String) {
        self.title = title
        self.shortInfo = shortInfo
        self.tags = tags
        self.ingredients = []
        self.instructions = instructions
        self.isFavorite = false
    }
    
    func add(ingredient: String) -> Void {
        self.ingredients.append(ingredient)
    }
    
    func add(tag: String) -> Void {
        self.tags.append(tag)
    }
    
    func remove(ingredient: String) -> Void {
        let index = self.ingredients.firstIndex(of: ingredient)
        if index == -1 {
            return
        }
        
        self.ingredients.remove(at: index!)
    }
    
    func remove(tag: String) -> Void {
        let index = self.tags.firstIndex(of: tag)
        if index == -1 {
            return
        }
        
        self.tags.remove(at: index!)
    }
    
    func share() -> Void {
        print("Sharing recipe: \(title)")
    }
}
