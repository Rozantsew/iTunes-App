//
//  APIError.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 29/11/2022.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    
    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
            case .badURL:
                return "badURL"
            case .urlSession(let error):
                return "urlSession error: \(error.debugDescription)"
            case .badResponse(let statusCode):
                return "bad response with status code \(statusCode)"
            case .decoding(let decoddingError):
                return "decoding error \(decoddingError)"
            case .unknown:
                return "unknown error"
        }
    }
    var localizedDescription: String {
        switch self {
        case .badURL, .unknown:
            return "something went wronk"
        case .urlSession(let urlError):
            return urlError?.localizedDescription ?? "sometning went wrong"
        case .badResponse(_):
            return "something went wrong"
        case .decoding(let decodingError):
            return decodingError?.localizedDescription ?? "sometning went wrong"
        }
    }
}
