////
////  ContentView.swift
////  PokemonCards
////
////  Created by Tsvetelina Cholakova on 19/12/2022.
//
import SwiftUI

struct PokemonCardsDetailView: View {
    let name: String
    let image: String
    
    var body: some View {
        VStack {
            Text(name.uppercased())
                .padding()
                .font(.headline)
            AsyncImage(
                url: URL(string: image)!,
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {
                   // Color.gray
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                })
            //.frame(width: 400, height: 500)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .mask(RoundedRectangle(cornerRadius: 16))
            
        }
        .padding()
    }
}
