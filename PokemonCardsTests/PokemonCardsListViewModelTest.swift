//
//  PokemonCardsListViewModelTest.swift
//  PokemonCardsTests
//
//  Created by Tsvetelina Cholakova on 21/12/2022.
//

import XCTest
@testable import PokemonCards

final class PokemonCardsListViewModelTest: XCTestCase {
    
    var fakeNetworkManager: FakeNetworkManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        fakeNetworkManager = FakeNetworkManager(fileName: "PokemonCardsMock")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        fakeNetworkManager = nil
    }

    func testFetchPokemonList() throws {
        let pokemonCardsListViewModel = PokemonCardsListViewModel(networkManager: fakeNetworkManager)
        XCTAssertNotNil(pokemonCardsListViewModel)
        
        pokemonCardsListViewModel.fetchPokemonList()
        
        let pokemonCard = pokemonCardsListViewModel.pokemonCards[0]
        XCTAssertEqual(pokemonCard.name, "Absol G")
        
        XCTAssertNotNil(pokemonCardsListViewModel.pokemonCards)
        XCTAssertGreaterThan(pokemonCardsListViewModel.pokemonCards.count, 10)
    }
    
    func testErrorIsFalse() {
        let pokemonCardsListViewModel = PokemonCardsListViewModel(networkManager: fakeNetworkManager)
        pokemonCardsListViewModel.fetchPokemonList()
        XCTAssertEqual(pokemonCardsListViewModel.errorOccured, false)
    }
    
//    func testErrorIsTrue() {
//        let fakeNetworkManager = FakeNetworkManager(fileName: "")
//        let pokemonCardsListViewModel = PokemonCardsListViewModel(networkManager: fakeNetworkManager)
//        pokemonCardsListViewModel.fetchPokemonList()
//        XCTAssertEqual(pokemonCardsListViewModel.errorOccured, true)
//    }
    
    

   

}
