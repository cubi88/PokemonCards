//
//  PokemonCardsApp.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import SwiftUI

@main
struct PokemonCardsApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonCardsListView(viewModel: PokemonCardsListViewModel(repository: PokemonCardsRepositoryImplementation(networkManager: NetworkManager())))
        }
    }
}
