//
//  AlbumListViewModel.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 25/11/2022.
//

import Foundation
import Combine

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
// https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

class AlbumListViewModel: ObservableObject {
    
    enum State: Comparable {
        case good
        case isLoading
        case loadedAll
        case error(String)
    }
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    @Published var state: State = .good {
        didSet {
            print("state changed to \(state)")
        }
    }
    
    let limit: Int = 20
    var page: Int = 0
    
    var subscriptions = Set<AnyCancellable>()
    
    // Combain function regarding to search View
    init() {
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [ weak self] term in
                self?.state = .good
                self?.albums = []
                self?.fetchAlbums(for: term)
        }.store(in: &subscriptions)
    }
    
    // This function will load more albums
    func loadMore() {
        fetchAlbums(for: searchTerm)
    }
    
    func fetchAlbums(for searchTearm: String) {
        
        // Check if there is a seach bar is empty
        guard !searchTearm.isEmpty else { return }
        
        guard state == State.good else { return }
        
        let offset = page * limit
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTearm)&entity=album&\(limit)&offset=\(page)") else { return }
        
        print("start fetching data for \(searchTearm)")
        state = .isLoading
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            if let error = error {
                print("Url session error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                }
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    DispatchQueue.main.async {
                        for album in result.results {
                            self?.albums.append(album)
                        }
                        self?.page += 1
                        self?.state = (result.results.count == self?.limit) ? .good : .loadedAll
                    }
                
                } catch {
                    print("Error: \(error)")
                    DispatchQueue.main.async {
                        self?.state = .error("Could not get data: \(error.localizedDescription)")
                    }
                }
            }
        }.resume()
   }
}
