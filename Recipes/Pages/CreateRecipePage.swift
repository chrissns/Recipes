//
//  CreateRecipePage.swift
//  Recipes
//
//  Created by Christian Sohns on 6/27/23.
//

import SwiftUI

struct CreateRecipePage: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State var recipe: Recipe = Recipe(title: "", shortInfo: "", ingredients: [], instructions: "")
    
    var body: some View {
        ZStack {
            List {
                Section {
                    // Text field for the name
                    TextField("Name...", text: $recipe.title)
                    TextField("Short info...", text: $recipe.shortInfo)
                } header: {
                    Text("Name and info")
                }
                Section {
                    // A list of items with a text field for name, number select for amount and dropdown select for unit
                    ForEach(recipe.ingredients) { ingredient in
                        HStack {
                            Text(ingredient.name)
                        }
                    }
                } header: {
                    HStack {
                        Text("Ingredients")
                        Spacer()
                        Button {
                            recipe.ingredients.append(Ingredient(name: "", amount: ""))
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                Section {
                    // Long text area
                    TextField("Write instructions...", text: $recipe.instructions)
                } header: {
                    Text("Instructions")
                }
            }
            VStack {
                Spacer()
                VStack(alignment: .center) {
                    Button {
                        createRecipe()
                    } label: {
                        Text("Create recipe")
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
        .navigationTitle("New recipe")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func createRecipe() {
        modelContext.insert(recipe)
        dismiss()
    }
}
