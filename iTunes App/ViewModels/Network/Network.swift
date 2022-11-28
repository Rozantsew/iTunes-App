//
//  NetworkDataFetch.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 23/11/2022.
//

//import Foundation
//
//class Network: ObservableObject {
//    @Published var albums = [AlbumSearch]()
//    
//    
//    
//    func getAlbums() {
//        guard let url=URL(string: "https://itunes.apple.com/search?term=jack+johnson") else { fatalError("Missing URL")}
//        
//        let urlRequest = URLRequest(url: url)
//        
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("Request error:", error)
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse else { return }
//            
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedAlbums = try JSONDecoder().decode([AlbumSearch].self, from: data)
//                        self.albums = decodedAlbums
//                        
//                    } catch let error {
//                        print("Error decoding", error)
//                    }
//                }
//            }
//        }
//        dataTask.resume()
//    }
//}
