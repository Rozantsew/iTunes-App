//
//  AlbumListView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 25/11/2022.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject var viewModel: AlbumListViewModel
    
    var body: some View {
        
            List {
                ForEach(viewModel.albums) { album in
                    Text(album.collectionName)
                }
                
                switch viewModel.state {
                    case .good:
                        Color.clear
                            .onAppear {
                                viewModel.loadMore()
                            }
                    
                    case .isLoading:
                        ProgressView()
                            .progressViewStyle(.circular).frame(maxWidth: .infinity)
                    
                    case .loadedAll:
                        Color.gray
                    
                    case .error(let message):
                        Text(message)
                            .foregroundColor(.pink)
                }
            }
            .listStyle(.plain)
        
    }
}



struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView(viewModel: AlbumListViewModel())
    }
}
