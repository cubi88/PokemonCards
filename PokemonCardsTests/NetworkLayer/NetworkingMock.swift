//
//  NetworkingMock.swift
//  PokemonCardsTests
//
//  Created by Tsvetelina Cholakova on 19/12/2022.

import Foundation
@testable import PokemonCards

class NetworkingMock: Networking {
    static var data: Data?

    func data(
        from url: URL,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse) {
        guard let data = NetworkingMock.data else {
            throw NetworkError.dataNotFound
        }
        return (data, URLResponse())
    }
}
