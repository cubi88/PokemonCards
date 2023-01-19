//
//  PokemonCardsRepository.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 22/12/2022.
//

import Foundation
import Combine

protocol PokemonCardsRepository{
    func getCards(for url: URL) async throws -> PokemonListData
}
struct PokemonCardsRepositoryImplementation {
    private let networkManager: Fetchable
    private var cancellables = Set<AnyCancellable>()

    init(networkManager: Fetchable) {
        self.networkManager = networkManager
    }
}
extension PokemonCardsRepositoryImplementation: PokemonCardsRepository {
    func getCards(for url: URL) async throws -> PokemonListData {
        let cardsData =  try await networkManager.get(url: url)
        let cards = try JSONDecoder().decode(PokemonListData.self, from: cardsData )
        return cards
    }
}
