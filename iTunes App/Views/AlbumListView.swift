//
//  AlbumListView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 25/11/2022.
//

import SwiftUI

struct AlbumListView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.albums) { album in
                Text(album.collectionName)
            }
            .listStyle(.grouped)
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Album")
            
            
            .onAppear {
                viewModel.fetchAlbums(for: viewModel.searchTerm)
            }
        }
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}
