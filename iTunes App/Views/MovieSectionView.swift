//
//  MovieSectionView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 14/12/2022.
//

import SwiftUI

struct MovieSectionView: View {
    
    var movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top) {
                ForEach(movies) { movie in
                    VStack(alignment: .leading) {
                        ImageLoadingView(urlString: movie.artworkUrl100, height: 100, width: 70)
                        Text(movie.wrapperType)
                        Text(movie.artistName)
                            .foregroundColor(.gray)
                    }
                    .lineLimit(2)
                    .frame(width: 100)
                    .font(.caption)
                    
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct MovieSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSectionView(movies: [Movie.example()])
    }
}
