//
//  AlbumListViewModel.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 25/11/2022.
//

import Foundation
import Combine

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

class AlbumListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    
    let limit: Int = 20
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
       
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [ weak self] term in
            self?.fetchAlbums(for: term)
        }.store(in: &subscriptions)
    }
    
    func fetchAlbums(for searchTearm: String) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTearm)&entity=album&\(limit)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error {
                print("Url session error: \(error.localizedDescription)")
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    DispatchQueue.main.async {
                        self.albums = result.results
                    }
                
                } catch {
                    print("Error: \(error)")
                }
            }
        }.resume()
   }
}
