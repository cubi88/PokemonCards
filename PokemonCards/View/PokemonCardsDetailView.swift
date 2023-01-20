////
////  ContentView.swift
////  PokemonCards
////
////  Created by Tsvetelina Cholakova on 19/12/2022.
//
import SwiftUI

struct PokemonCardsDetailView: View {
    let name: String
    let url: URL
    var body: some View {
        VStack{
        Text("Pokemon Name: " + name.uppercased())
            .padding()
            .font(.headline)
        PokemonAsyncImageView(url: url)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .mask(RoundedRectangle(cornerRadius: 16))
        }
        .padding()
    }
}
