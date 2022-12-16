//
//  MovieRowView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 14/12/2022.
//

import SwiftUI

struct MovieRowView: View {
    
    let movie: Movie
    
    var body: some View {
        HStack {
            ImageLoadingView(urlString: movie.artworkUrl100, height: 100, width: 70)
            
            VStack(alignment: .leading) {
                Text(movie.trackName)
                VStack(alignment: .leading) {
                    Text(movie.artistName)
                        .foregroundColor(.black)
                        .font(.caption)
                    Text(movie.releaseDate)
                        .foregroundColor(.gray)
                        .font(.caption2)
                }
                
            }.lineLimit(1)
            
            Spacer()
            
            BuyButtonView(urlString: movie.trackViewURL, price: movie.trackHDPrice, currency: movie.currency)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.example())
    }
}
