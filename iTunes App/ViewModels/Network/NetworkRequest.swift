//
//  NetworkRequest.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 24/11/2022.
//

//import Foundation
//
//class NetworkRequest {
//    
//    static let shared = NetworkRequest()
//    
//    private init() {}
//    
//    func requestData(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
//        
//        guard let url = URL(string: urlString) else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            DispatchQueue.main.async {
//                if let error = error {
//                    completion(.failure(error))
//                    return
//                }
//                guard let data = data else { return }
//                completion(.success(data))
//            }
//        }
//        .resume()
//    }
//}
//
//class NetworkDataFetch {
//    
//    static let shared = NetworkDataFetch()
//    
//    private init() {}
//    
//    func fetchAlbum(urlString: String, response: @escaping (AlbumSearch?, Error?) -> Void) {
//        
//        NetworkRequest.shared.requestData(urlString: urlString) { result in
//            switch result {
//            case .success(let data):
//                do {
//                    let albums = try JSONDecoder().decode(AlbumSearch.self, from: data)
//                    response(albums, nil)
//                } catch let jsonError {
//                    print("Error", jsonError)
//                }
//            
//            case .failure(let error):
//            print("Error recived reusting data \(error.localizedDescription)")
//            response(nil, error)
//            }
//        }
//    }
//}
//
//let album = [Album]()
//
//
//private func fetchAlbums(albumName: String) {
//    
//    let urlString = "https://itunes.apple.com/search?term=\(albumName)&entity=album&attribute=albumTerm"
//    
//    NetworkDataFetch.shared.fetchAlbum(urlString: urlString) { [weak self] AlbumSearch, error in
//        
//        if error == nil {
//            guard let albumSearch = AlbumSearch else { return }
//            
//            self?.albums = albumSearch.results
//            print(self?.albums)
//            
//        } else {
//            print(error!.localizedDescription)
//        }
//    }
//    
//}
//fetchAlbums(albumName: "Sheffield")
