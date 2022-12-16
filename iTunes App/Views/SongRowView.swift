//
//  SongListRow.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 14/12/2022.
//

import SwiftUI

struct SongRowView: View {
    
    var song: Song
    
    var body: some View {
        HStack {
            ImageLoadingView(urlString: song.artworkUrl60, height: 60, width: 60)
            
            
            VStack(alignment: .leading) {
                Text(song.trackName)
                Text(song.artistName + " - " + song.collectionName)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .lineLimit(1)
            
            Spacer(minLength: 20)
            
            BuyButtonView(urlString: song.collectionViewURL, price: song.trackPrice, currency: song.currency)
            }
        }
    }


struct SongListRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRowView(song: Song.example())
    }
}
