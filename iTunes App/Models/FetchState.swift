//
//  FetchState.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 01/12/2022.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}
