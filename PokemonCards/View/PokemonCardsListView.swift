//
//  ContentView.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import SwiftUI

struct PokemonCardsListView: View {
    @StateObject var viewModel: PokemonCardsListViewModel
    private let columns = [ GridItem(), GridItem()]
    var body: some View {
        NavigationStack {
            ScrollView {
                pokemonGrid
            }
            .navigationTitle("Pokemon Cards")
            .onAppear{
                viewModel.getPokemonCards(urlStr: Endpoint.pokemonUrl)
            }
            .navigationDestination(for: Pokemon.self) { pokemon in
                if let url = pokemon.largeImageUrl {
                    PokemonCardsDetailView(name: pokemon.name, url: url)
                }
            }
        }
    }
    private var pokemonGrid: some View {
        LazyVGrid(columns: columns) {
            ForEach(self.viewModel.pokemonCards, id: \.id) { pokemon in
                NavigationLink(value: pokemon) {
                    if let url = pokemon.smallImageUrl {
                        PokemonCellView(imageUrl: url, name: pokemon.name)
                    }
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardsListView(viewModel: PokemonCardsListViewModel(repository: PokemonCardsRepositoryImplementation(networkManager: NetworkManager())))
    }
}
