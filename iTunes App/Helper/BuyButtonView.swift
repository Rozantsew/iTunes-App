//
//  BuyButtonView.swift
//  iTunes App
//
//  Created by Mykhailo Rozantsev on 14/12/2022.
//

import SwiftUI

struct BuyButtonView: View {
    
    let urlString: String
    var price: Double?
    let currency: String
    
    var body: some View {
        if let url = URL(string: urlString), let price = price {
            Link(destination: url) {
                Text("\(String(format:"%.2f", price)) \(currency)")
            }
            .buttonStyle(BuyButtonStyle())
        }
    }
}

