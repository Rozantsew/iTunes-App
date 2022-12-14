//
//  SearchAllListView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 13/12/2022.
//

import SwiftUI

struct SearchAllListView: View {
    
    @ObservedObject var albumListViewModel: AlbumListViewModel
    @ObservedObject var songListViewModel: SongListViewModel
    @ObservedObject var movieListViewModel: MovieListViewModel
    
    var body: some View {
        Text("Search all")
    }
}

