//
//  DogBreedsViewModel.swift
//  DogBreeds
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import Foundation

class PokemonCardsListViewModel: ObservableObject {
    @Published var pokemonCards: [Pokemon] = []
    @Published var pokemonImages: [Images] = []
    @Published var errorOccured: Bool = false
    
    var networkManager: Fetchable
    
    
    init(networkManager: Fetchable) {
        self.networkManager = networkManager
    }
    
    func fetchPokemonList() {
        let request = Request(baseUrl:"https://api.pokemontcg.io", path:"/v2/cards?page=1&pageSize=15", params: [:], type: "GET", header: [:])
        
        networkManager.fetch(request: request, type: PokemonListData.self) { result in
            switch result {
            case .success(let cards):
                print(cards)
               // DispatchQueue.main.async {
                    self.pokemonCards = cards.data
                //}
                self.errorOccured = false
            case .failure(let error):
                print(error)
                self.errorOccured = true
                
            }
        }
    }
}
