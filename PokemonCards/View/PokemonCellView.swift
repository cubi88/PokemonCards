//
//  PokemonCellView.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 21/12/2022.
//

import SwiftUI

struct PokemonCellView: View {
    let image: String
    let name: String
    
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: image)!,
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {
                    Color.gray
                })
            .frame(width: 250, height: 250)
            .mask(RoundedRectangle(cornerRadius: 16))
        }
    }
}
struct PokemonCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCellView(image: "https://images.pokemontcg.io/pl3/1.png", name: "pokemon")
    }
}
