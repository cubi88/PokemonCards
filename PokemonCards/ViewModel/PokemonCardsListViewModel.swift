//
//  PokemonCardsListViewModel.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import Foundation
import Combine

protocol PokemonCardsListViewModelAction: ObservableObject {
    func getPokemonCards(urlStr: String)
}
final class PokemonCardsListViewModel {
    @Published private(set) var pokemonCards: [Pokemon] = []
    @Published private(set) var errorOccured: Bool = false
    private let repository: PokemonCardsRepository
    init(repository: PokemonCardsRepository) {
        self.repository = repository
    }
}
extension PokemonCardsListViewModel: PokemonCardsListViewModelAction {
    func getPokemonCards(urlStr: String) {
        guard let url = URL(string: urlStr) else {
            return
        }
        Task {
            do {
                let cards = try await repository.getCards(for: url)
                dataToPublisher(allCards: cards.data)
            }catch {
                dataToPublisher(allCards: [])
            }
        }
    }
}
extension PokemonCardsListViewModel {
    private func dataToPublisher(allCards: [Pokemon]) {
         DispatchQueue.main.async {
             self.pokemonCards = allCards
         }
     }
}
