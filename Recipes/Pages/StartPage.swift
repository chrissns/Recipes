//
//  StartPage.swift
//  Recipes
//
//  Created by Christian Sohns on 6/26/23.
//

import SwiftUI

let iconSize = 25.0

struct StartPage: View {
    var body: some View {
        List {
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
                    FavoritesPage()
                } label: {
                    HStack {
                        Image(systemName: "star")
                            .frame(width: iconSize, height: iconSize)
                        VStack(alignment: .leading) {
                            Text("Favorites")
                                .font(.headline)
                            Text("Your favorite recipes.")
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            Section {
                NavigationLink {
                    CreateRecipePage()
                } label: {
                    HStack {
                        Image(systemName: "plus")
                            .frame(width: iconSize, height: iconSize)
                        VStack(alignment: .leading) {
                            Text("Create")
                                .font(.headline)
                        }
                    }
                }
            }
        }
        .navigationTitle("Recipes")
        .navigationBarTitleDisplayMode(.large)
    }
}
