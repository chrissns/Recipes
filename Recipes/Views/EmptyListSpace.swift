//
//  EmptyListItem.swift
//  Recipes
//
//  Created by Christian Sohns on 7/2/23.
//

import SwiftUI

struct EmptyListSpace: View {
    
    @State
    var height: Float
    
    var body: some View {
        VStack {
        }
        .frame(height: CGFloat(height))
        .listRowBackground(Color.clear)
    }
}
