//
//  SongImage.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 14/12/2022.
//

import SwiftUI

struct ImageLoadingView: View {

    let urlString: String
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .border(Color(white: 0.5))
            
        } placeholder: {
            ProgressView()
        }
        .frame(width: size, height: size)
    }
}


