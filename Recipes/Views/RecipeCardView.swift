//
//  RecipeCardView.swift
//  Recipes
//
//  Created by Christian Sohns on 6/26/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var recipe: Recipe
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text(recipe.title)
                        .font(.headline)
                }
            }
            Section {
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .foregroundStyle(.gray)
                }
            } header: {
                Text("Ingredients")
            }
            Section {
                Text(recipe.instructions)
            } header: {
                Text("Instructions")
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    recipe.isFavorite.toggle()
                } label: {
                    if recipe.isFavorite {
                        Image(systemName: "star.fill")
                    } else {
                        Image(systemName: "star")
                    }
                }
            }
        }
    }
}
