//
//  CreateRecipePage.swift
//  Recipes
//
//  Created by Christian Sohns on 6/27/23.
//

import SwiftUI

struct CreateRecipePage: View {
    
    @Environment(\.dismiss) 
    private var dismiss
    
    @Environment(\.modelContext) 
    private var modelContext
    
    @State 
    var recipe: Recipe = Recipe(title: "", shortInfo: "", tags: [], instructions: "")
    
    @State 
    var editing: Bool = false
    
    var body: some View {
        ZStack {
            List {
                Section {
                    TextField("Name...", text: $recipe.title)
                    TextField("Short info...", text: $recipe.shortInfo)
                } header: {
                    Text("Name and info")
                }
                Section {
                    if recipe.tags.count > 0 {
                        ForEach(recipe.tags.indices, id: \.self) { index in
                            HStack {
                                Image(systemName: "number")
                                TextField("Tag...", text: self.$recipe.tags[index])
                            }
                            .swipeActions {
                                Button() {
                                    withAnimation {
                                        recipe.remove(tag: self.recipe.tags[index])
                                    }
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                        }
                    } else {
                        Text("Tap the \"+\" icon to add a tag.")
                            .foregroundStyle(.gray)
                    }
                } header: {
                    HStack {
                        Text("Tags")
                        Spacer()
                        Button {
                            recipe.add(tag: "")
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                Section {
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
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                Section {
                    TextField("Write instructions...", text: $recipe.instructions, axis: .vertical)
                } header: {
                    Text("Instructions")
                }
                EmptyListSpace(height: 40.0)
            }
            VStack {
                Spacer()
                VStack(alignment: .center) {
                    Button {
                        saveRecipe()
                    } label: {
                        Text(editing ? "Save recipe" : "Create recipe")
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
        .navigationTitle(editing ? "Edit recipe" : "New recipe")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func saveRecipe() {
        if !editing {
            modelContext.insert(recipe)
        }
        dismiss()
    }
}
