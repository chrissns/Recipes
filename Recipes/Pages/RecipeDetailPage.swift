//
//  RecipeCardView.swift
//  Recipes
//
//  Created by Christian Sohns on 6/26/23.
//

import SwiftUI
import WidgetKit

struct RecipeDetailPage: View {
    
    @State
    var recipe: Recipe
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    Text(recipe.title)
                        .font(.headline)
                    Text(recipe.shortInfo)
                        .foregroundStyle(.gray)
                }
            }
            Section {
                HStack(spacing: 3.0) {
                    ForEach(recipe.tags, id: \.self) { tag in
                        TagView(text: tag, icon: "number")
                    }
                }
            } header: {
                Text("Tags")
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
                ForEach(recipe.instructions, id: \.self) { ingredient in
                    Text(ingredient)
                        .foregroundStyle(.gray)
                }
            } header: {
                Text("Instructions")
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                NavigationLink {
                    CreateRecipePage(recipe: recipe, editing: true)
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
            ToolbarItem {
                Button {
                    recipe.isFavorite.toggle()
                    WidgetCenter.shared.reloadTimelines(ofKind: "Recipes")
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
