//
//  FakePokemonCardsRepository.swift
//  PokemonCardsTests
//
//  Created by Tsvetelina Cholakova on 22/12/2022.
//

import Foundation
@testable import PokemonCards

class FakePokemonCardsRepository: PokemonCardsRepository {
    var error: NetworkError?

    func getCards(for url: URL) async throws -> PokemonCards.PokemonListData {
        guard error == nil else { throw error! }
        return FakePokemonCardsRepository.mockData()
    }
    
    static func mockData() -> PokemonListData{
        let bundle = Bundle(for: FakePokemonCardsRepository.self)
        if let path =  bundle.url(forResource: "PokemonCardsMock", withExtension: "json") {
            if let data = try? Data(contentsOf: path){
                do {
                    let jsonDecoder = JSONDecoder()
                    let responce = try jsonDecoder.decode(PokemonListData.self, from: data)
                    return responce
                } catch {
                    return PokemonListData(data: [])
                }
            }
        }
        return PokemonListData(data: [])
    }
    
}
