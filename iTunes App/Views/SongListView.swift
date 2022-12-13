//
//  SongListView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 13/12/2022.
//

import SwiftUI

struct SongListView: View {

@ObservedObject var viewModel: SongListViewModel

var body: some View {
        
    List {
        ForEach(viewModel.songs) { song in
            Text(song.trackName)
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



struct SongListView_Previews: PreviewProvider {
static var previews: some View { 
    SongListView(viewModel: SongListViewModel())
}
}
