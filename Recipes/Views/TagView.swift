//
//  TagView.swift
//  Recipes
//
//  Created by Christian Sohns on 7/2/23.
//

import SwiftUI

struct TagView: View {
    
    @State
    var text: String
    
    @State
    var icon: String
    
    var body: some View {
        VStack {
            HStack(spacing: 3.0) {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 11.0, height: 11.0)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                Text(text)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .fontDesign(.rounded)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .padding(5)
        }
        .background {
            Color(.accent)
        }
        .cornerRadius(5.0)
    }
}
