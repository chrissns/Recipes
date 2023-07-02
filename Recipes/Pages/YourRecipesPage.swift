//
//  YourRecipesPage.swift
//  Recipes
//
//  Created by Christian Sohns on 6/26/23.
//

import SwiftUI
import SwiftData

struct YourRecipesPage: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
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
                .swipeActions {
                    Button() {
                        withAnimation {
                            modelContext.delete(object: recipe)
                        }
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                }
            }
        }
        .navigationTitle("Your recipes")
        .navigationBarTitleDisplayMode(.inline)
    }
}
