//
//  SongListViewModel.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 01/12/2022.
//

import Foundation
import Combine

class SongListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var songs: [Song] = [Song]()
    @Published var state: FetchState = .good
    
    private let service = APIService( )
    
    let limit: Int = 20
    var page: Int = 0
    
    var subscriptions = Set<AnyCancellable>()
    
    // Combain function regarding to search View
    init() {
        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            // Sink is the code receives data and completion events
            // or errors from a publisher and deals with them.
            .sink { [ weak self] term in
                self?.clear()
                self?.fetchSongs(for: term)
        }.store(in: &subscriptions)
    }
    
    func clear() {
        state = .good
        songs = []
        page = 0
    }
    
    func loadMore() {
        fetchSongs(for: searchTerm)
    }
    
    func fetchSongs(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == FetchState.good else {
            return
        }
        
        state = .isLoading
        
        service.fetchSongs(searchTerm: searchTerm, page: page, limit: limit ) { [weak self ] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    for songs in results.results {
                        self?.songs.append(songs)
                    }
                    self?.page += 1
                    self?.state = (results.results.count == self?.limit) ? .good : .loadedAll
                    print("fetched songs \(results.resultCount)")
                    
                case .failure(let error):
                    print("Could not load: \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
}

//func example() -> SongListViewModel {
//    let vm = SongListViewModel()
//    vm.songs = []
//}
