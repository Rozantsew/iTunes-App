//
//  AlbumPlaceholderView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 28/11/2022.
//

import SwiftUI

struct AlbumPlaceholderView: View {
    
    @Binding var searchTerm: String
    let suggestions = ["Rammstein", "cry to me", "maneskin"]
    
    var body: some View {
        VStack {
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


