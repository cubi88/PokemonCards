//
//  FakeNetworkManager.swift
//  PokemonCardsTests
//
//  Created by Tsvetelina Cholakova on 21/12/2022.
//

import Foundation
@testable import PokemonCards

class FakeNetworkManager: Fetchable {
    func get(url: URL) async throws -> Data {
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path =  bundle.url(forResource:url.absoluteString, withExtension: "json") else {
                throw NetworkError.invalidUrl
            }
            let data = try Data(contentsOf: path)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
