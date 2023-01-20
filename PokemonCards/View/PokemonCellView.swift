//
//  PokemonCellView.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 21/12/2022.
//

import SwiftUI

struct PokemonCellView: View {
    let imageUrl: URL
    let name: String
    var body: some View {
        VStack {
            PokemonAsyncImageView(url: imageUrl)
            .frame(width: 250, height: 250)
            .mask(RoundedRectangle(cornerRadius: 16))
        }
    }
}
