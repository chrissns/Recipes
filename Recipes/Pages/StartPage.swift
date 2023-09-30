//
//  StartPage.swift
//  Recipes
//
//  Created by Christian Sohns on 6/26/23.
//

import SwiftUI
import SwiftData

let iconSize = 25.0

struct StartPage: View {
    
    @State
    private var searchText: String = ""
    
    @Query
    private var recipes: [Recipe]
    
    var body: some View {
        ZStack {
            List {
                if searchText.count == 0 {
                    Section {
                        NavigationLink {
                            YourRecipesPage()
                        } label: {
                            HStack {
                                Image(systemName: "books.vertical")
                                    .frame(width: iconSize, height: iconSize)
                                VStack(alignment: .leading) {
                                    Text("Your recipes")
                                        .font(.headline)
                                    Text("Recipes you made yourself.")
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        NavigationLink {
                            Text("No shared recipes")
                                .font(.title)
                                .foregroundStyle(.gray)
                                .navigationTitle("Shared")
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                    .frame(width: iconSize, height: iconSize)
                                VStack(alignment: .leading) {
                                    Text("Shared recipes")
                                        .font(.headline)
                                    Text("Recipes that somebody shared with you.")
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                    }
                    Section {
                        if favoriteRecipes().count > 0 {
                            ForEach(favoriteRecipes()) { recipe in
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
                        } else {
                            Text("Tap the star icon in your recipe to add it to your favorites.")
                                .foregroundStyle(.gray)
                        }
                    } header: {
                        Text("Favorites")
                    }
                    EmptyListSpace(height: 40.0)
                } else {
                    Section {
                        if filteredRecipes().count > 0 {
                            ForEach(filteredRecipes()) { recipe in
                                NavigationLink {
                                    RecipeDetailPage(recipe: recipe)
                                } label: {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(recipe.title)
                                                .font(.headline)
                                            Text(recipe.shortInfo)
                                                .foregroundStyle(.gray)
                                            HStack(spacing: 3.0) {
                                                ForEach(filteredIngredients(recipe: recipe), id: \.self) { instruction in
                                                    TagView(text: instruction, icon: "plus")
                                                }
                                            }
                                            HStack(spacing: 3.0) {
                                                ForEach(filteredTags(recipe: recipe), id: \.self) { instruction in
                                                    TagView(text: instruction, icon: "number")
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            Text("Couldn't find anything for your search.")
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .toolbar, prompt: "Search for recipes, ingredients, ...")
            if searchText.count == 0 {
                VStack {
                    Spacer()
                    VStack(alignment: .center) {
                        NavigationLink {
                            CreateRecipePage()
                        } label: {
                            Text("New recipe")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    }
                    .listRowBackground(Color.clear)
                    .padding(EdgeInsets(top: 0, leading: 30.0, bottom: 25.0, trailing: 30.0))
                    .shadow(radius: 10.0)
                }
            }
        }
        .navigationTitle("Recipes")
        .navigationBarTitleDisplayMode(.large)
    }
    
    func favoriteRecipes() -> [Recipe] {
        return recipes.filter { $0.isFavorite }
    }
    
    func filteredRecipes() -> [Recipe] {
        return recipes.filter { recipe in
            return recipe.title.lowercased().contains(searchText.lowercased())
                || recipe.shortInfo.lowercased().contains(searchText.lowercased())
                || recipe.ingredients.filter { $0.lowercased().contains(searchText.lowercased()) }.count > 0
                || recipe.tags.filter { $0.lowercased().contains(searchText.lowercased()) }.count > 0
        }
    }
    
    func filteredIngredients(recipe: Recipe) -> [String] {
        return recipe.ingredients.filter(maxItems: 2) { ingredient in
            ingredient.lowercased().contains(searchText.lowercased())
        }
    }
    
    func filteredTags(recipe: Recipe) -> [String] {
        return recipe.tags.filter { tag in
            tag.lowercased().contains(searchText.lowercased())
        }
    }
}
