//
//  ContentView.swift
//  Recipes
//
//  Created by Christian Sohns on 6/26/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext)
    private var modelContext
    
    var body: some View {
        NavigationStack {
            StartPage()
        }
    }
}
