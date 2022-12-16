//
//  AlbumSectionView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 14/12/2022.
//

import SwiftUI

struct AlbumSectionView: View {
    
    let albums: [Album]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top) {
                ForEach(albums) { album in
                    VStack(alignment: .leading) {
                        ImageLoadingView(urlString: album.artworkUrl100, height: 100, width: 100)
                        Text(album.wrapperType)
                        Text(album.artistName)
                            .foregroundColor(.gray)
                    }
                    .lineLimit(1)
                    .frame(width: 100)
                    .font(.caption)
                    
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct AlbumSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSectionView(albums: [Album.example()])
    }
}
