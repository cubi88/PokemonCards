//
//  PokemonAsyncImageView.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 20/01/2023.
//
import SwiftUI

struct PokemonAsyncImageView: View {
    let url: URL
    var body: some View {
        AsyncImage(
            url: url,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            })
    }
}
