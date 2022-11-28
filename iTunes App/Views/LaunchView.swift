//
//  ContentView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 22/11/2022.
//

import SwiftUI

struct LaunchView: View {
    
    var body: some View {
        VStack {
            AlbumSearchView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
