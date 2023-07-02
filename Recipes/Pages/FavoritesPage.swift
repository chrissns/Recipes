//
//  FavoritesPage.swift
//  Recipes
//
//  Created by Christian Sohns on 6/26/23.
//

import SwiftUI
import SwiftData

struct FavoritesPage: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    
    var body: some View {
        List {
            ForEach(favoriteRecipes()) { recipe in
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    HStack {
                        Image(systemName: "person")
                            .frame(width: iconSize, height: iconSize)
                        VStack(alignment: .leading) {
                            Text(recipe.title)
                                .font(.headline)
                            Text(recipe.shortInfo)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
        }
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func favoriteRecipes() -> [Recipe] {
        return recipes.filter { $0.isFavorite }
    }
}
