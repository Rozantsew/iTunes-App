//
//  SongImage.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 14/12/2022.
//

import SwiftUI

struct ImageLoadingView: View {

    let urlString: String
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        
        AsyncImage(url: URL(string: urlString)) { phase in
            
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: width, height: height)
            case .failure(_):
                Color.gray
                    .frame(width: width, height: height)
            case .success(let image):
                image
                    .resizable()
                    .border(Color(white: 0.5))
                    .scaledToFit()
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: width, height: height)
    }
}


