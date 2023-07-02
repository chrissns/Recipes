//
//  TagView.swift
//  Recipes
//
//  Created by Christian Sohns on 7/2/23.
//

import SwiftUI

struct TagView: View {
    
    @State var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundStyle(.white)
                .padding(5)
                .lineLimit(1)
        }
        .background {
            Color(red: 0.75, green: 0.75, blue: 0.8)
        }
        .cornerRadius(5.0)
    }
}
