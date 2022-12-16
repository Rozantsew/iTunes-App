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
        ScrollView {
            LazyVStack {
                
                HStack {
                    Text("Songs")
                        .font(.title2)
                    Spacer()
                    
                    NavigationLink {
                        SongListView(viewModel: songListViewModel)
                    } label: {
                        HStack {
                            
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }.padding()
                
                SongSectionView(songs: songListViewModel.songs)
                
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Text("Album")
                        .font(.title2)
                    Spacer()
                    
                    NavigationLink {
                        AlbumListView(viewModel: albumListViewModel)
                    } label: {
                        HStack {
                            
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }.padding()
                
                AlbumSectionView(albums: albumListViewModel.albums)
                
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Text("Movies")
                        .font(.title2)
                    Spacer()
                    
                    NavigationLink {
                        MovieListView(viewModel: movieListViewModel)
                    } label: {
                        HStack {
                            
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }.padding()
                
                
                MovieSectionView(movies: movieListViewModel.movies)
                
                Divider()
                    .padding(.bottom)
                
            }
        }
    }
}

