//
//  PokemonCardsListViewModelTest.swift
//  PokemonCardsTests
//
//  Created by Tsvetelina Cholakova on 21/12/2022.
//

import XCTest
@testable import PokemonCards

final class PokemonCardsListViewModelTest: XCTestCase {
    
    var fakePokemonCardRepository: FakePokemonCardsRepository!
    var pokemonCardsListViewModel : PokemonCardsListViewModel!

    override func setUpWithError() throws {
        fakePokemonCardRepository = FakePokemonCardsRepository()
        pokemonCardsListViewModel = PokemonCardsListViewModel(repository: fakePokemonCardRepository)
    }

    override func tearDownWithError() throws {
        fakePokemonCardRepository = nil
    }

    // when url is Incorrect , it will directly return empty array
    func test_GetPokemonCards_when_url_isIncorrect()  {
        pokemonCardsListViewModel.getPokemonCards(urlStr: "")
        XCTAssertEqual(pokemonCardsListViewModel.pokemonCards.count, 0)
    }
    
    // when url is Correct , it will  return data in array
    func testGetPokemonCards() throws {
        XCTAssertNotNil(pokemonCardsListViewModel)
        
        pokemonCardsListViewModel.getPokemonCards(urlStr: "testURL")
        
        let expectation = XCTestExpectation(
            description: "Fetching Pokemon Cards"
        )
        let asyncWaitDuration = 10.0 //
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {
            let pokemonCard = self.pokemonCardsListViewModel.pokemonCards[0]

            XCTAssertEqual(pokemonCard.name, "Absol G")
            
            XCTAssertNotNil(self.pokemonCardsListViewModel.pokemonCards)
            XCTAssertEqual(self.pokemonCardsListViewModel.pokemonCards.count, 15)

            XCTAssertGreaterThan(self.pokemonCardsListViewModel.pokemonCards.count, 10)

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: asyncWaitDuration)

    }
    
    func test_GetPokemonCards_when_url_isCorrectBut_API_Fails()  {
        let expectation = XCTestExpectation(
            description: "Fetching Pokemon Cards"
        )
        
        fakePokemonCardRepository.error = .dataNotFound

        pokemonCardsListViewModel.getPokemonCards(urlStr: "PokemonCardsMock")
        let asyncWaitDuration = 10.0 //
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {

            
            XCTAssertNotNil(self.pokemonCardsListViewModel.pokemonCards)
            XCTAssertEqual(self.pokemonCardsListViewModel.pokemonCards.count, 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: asyncWaitDuration)

    }
}
