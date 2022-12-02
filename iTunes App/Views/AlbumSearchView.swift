//
//  AlbumSearchView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 28/11/2022.
//

import SwiftUI

struct AlbumSearchView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.searchTerm.isEmpty {
                    HomePlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                    AlbumListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Album")
        }
    }
    
}

struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}
