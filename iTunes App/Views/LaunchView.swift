//
//  ContentView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 22/11/2022.
//

import SwiftUI

struct LaunchView: View {
    
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            AlbumSearchView()
                .tabItem {
                    Label("Albums", systemImage: "music.note")
                }
            
            MovieSearchView()
                .tabItem {
                    Label("Movies", systemImage: "tv")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
