//
//  ContentView.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import SwiftUI

struct PokemonCardsListView: View {
    
    @StateObject var viewModel : PokemonCardsListViewModel
    
    let columns = [ GridItem(), GridItem()]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(self.viewModel.pokemonCards, id: \.id) { pokemon in
                        NavigationLink(value: pokemon) {
                            PokemonCellView(image: pokemon.images.small, name: pokemon.name)
                        }
                    }
                    VStack(alignment: .leading, spacing: 4) {
                    }
                }
                .navigationTitle("Pokemon Cards")
                .onAppear{
                    viewModel.getPokemonCards(urlStr: Endpoint.pokemonUrl)
                }
                .navigationDestination(for: Pokemon.self) { pokemon in
                    VStack {
                        PokemonCardsDetailView(name: pokemon.name, image: pokemon.images.large)
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
