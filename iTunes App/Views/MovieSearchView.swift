//
//  SwiftUIView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 01/12/2022.
//

import SwiftUI

struct MovieSearchView: View {
    
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        
            
            Group {
                    MovieListView(viewModel: viewModel)
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Movies")
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
