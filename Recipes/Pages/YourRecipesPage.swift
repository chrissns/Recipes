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
                    RecipeDetailPage(recipe: recipe)
                } label: {
                    HStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                            .frame(width: iconSize, height: iconSize)
                        VStack(alignment: .leading) {
                            Text(recipe.title)
                                .font(.headline)
                            Text(recipe.shortInfo)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        withAnimation {
                            modelContext.delete(object: recipe)
                        }
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                }
                .contextMenu {
                    Button {
                        recipe.share()
                    } label: {
                        HStack(spacing: 3.0) {
                            Image(systemName: "square.and.arrow.up")
                            Text("Share recipe")
                        }
                    }
                }
            }
        }
        .navigationTitle("Your recipes")
        .navigationBarTitleDisplayMode(.inline)
    }
}
