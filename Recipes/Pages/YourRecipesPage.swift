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
    @State var searchText: String = ""
    
    var body: some View {
        List {
            ForEach(filteredRecipes()) { recipe in
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
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    func filteredRecipes() -> [Recipe] {
        return recipes.filter { recipe in
            recipe.title.contains(searchText) || searchText.count == 0
        }
    }
}
