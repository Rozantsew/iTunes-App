//
//  ContentView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 22/11/2022.
//

import SwiftUI

struct LaunchView: View {
//    @EnvironmentObject var network: Network
    
    var body: some View {
        VStack {
            AlbumListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
