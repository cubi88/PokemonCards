//
//  NetworkManagerTests.swift
//  PokemonCardsTests
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import XCTest
@testable import PokemonCards

final class NetworkManagerTests: XCTestCase {
    /**
     when api is successfull
     get function will return expected data , reading data from locally saved json.
     */
    func test_get_pokemon_when_api_is_success() async {
        // Reading local json file data
        let bundle = Bundle(for: NetworkManagerTests.self)
        guard let path =  bundle.url(forResource: "PokemonCardsMock", withExtension: "json") else { return }
        let data = try? Data(contentsOf: path)
        NetworkingMock.data = data
        
        let networkManager = NetworkManager(urlSession: NetworkingMock())
        let url = URL(string:"https://www.test.com")!
        let actualData = try! await networkManager.get(url: url)
        XCTAssertEqual(actualData, data)
    }
    /**
     when api is successfull but json parsing fails
     Fetch function will return jsonParsingFailed exception
     */
    func test_get_coins_when_api_failes() async {
        let networkManager = NetworkManager(urlSession: NetworkingMock())
        let url = URL(string:"https://www.test.com")!
        
        do {
            let _ = try await networkManager.get(url: url)
        }catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.dataNotFound)
        }
    }
}
