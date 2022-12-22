//
//  PokemonCardsRepositoryTest.swift
//  PokemonCardsTests
//
//  Created by Tsvetelina Cholakova on 22/12/2022.
//

import XCTest
@testable import PokemonCards

final class PokemonCardsRepositoryTest: XCTestCase {

    var fakeNetworkManager: FakeNetworkManager!
    var cardsRepository: PokemonCardsRepository!

    override func setUpWithError() throws {
        fakeNetworkManager = FakeNetworkManager()
        cardsRepository = PokemonCardsRepositoryImplementation(networkManager: fakeNetworkManager)
    }

    override func tearDownWithError() throws {
        cardsRepository = nil
    }

    //when it passes cards in array response
    func test_when_we_get_cards() async {
       
        let cardsData = try? await cardsRepository.getCards(for: URL(string:"PokemonCardsMock")!)
        XCTAssertNotNil(cardsData)
        XCTAssertEqual(cardsData?.data.count, 15)

        let pokemonCard = cardsData?.data[0]
        XCTAssertEqual(pokemonCard?.name, "Absol G")
    }
    
    //when it fails to return cards, cardsData will be nil
    func test_when_get_cards_fails() async {
       
        let cardsData = try? await cardsRepository.getCards(for: URL(string:"CardsResponse")!)
        XCTAssertNil(cardsData)
    }
}
