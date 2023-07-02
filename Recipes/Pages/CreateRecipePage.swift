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
    @State var recipe: Recipe = Recipe(title: "", shortInfo: "", instructions: "")
    
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
                    if recipe.ingredients.count > 0 {
                        ForEach(recipe.ingredients.indices, id: \.self) { index in
                            HStack {
                                TextField("Ingredient...", text: self.$recipe.ingredients[index])
                            }
                            .swipeActions {
                                Button() {
                                    withAnimation {
                                        recipe.remove(ingredient: self.recipe.ingredients[index])
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                        }
                    } else {
                        Text("Tap the \"+\" icon to add an ingredient.")
                            .foregroundStyle(.gray)
                    }
                } header: {
                    HStack {
                        Text("Ingredients")
                        Spacer()
                        Button {
                            recipe.add(ingredient: "")
                            print(recipe)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                Section {
                    // Long text area
                    TextField("Write instructions...", text: $recipe.instructions, axis: .vertical)
                } header: {
                    Text("Instructions")
                }
                EmptyListItem(height: 40.0)
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
