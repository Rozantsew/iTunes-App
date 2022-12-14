//
//  HomePlaceholderView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 01/12/2022.
//
//
import SwiftUI

struct HomePlaceholderView: View {
    
    @Binding var searchTerm: String
    let suggestions = ["Rammstein", "cry to me", "maneskin"]
    
    var body: some View {
        VStack {
            // Title
            Text("Trending")
                .font(.title)
            
            ForEach(suggestions, id: \.self) { sugestion in
                Button {
                    searchTerm = sugestion
                } label: {
                     Text(sugestion)
                        .font(.title2)
                }
            }
        }
    }
}

