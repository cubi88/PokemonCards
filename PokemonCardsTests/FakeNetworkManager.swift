//
//  FakeNetworkManager.swift
//  PokemonCardsTests
//
//  Created by Tsvetelina Cholakova on 21/12/2022.
//

import Foundation
@testable import PokemonCards


class FakeNetworkManager: Fetchable {
    var fileName: String
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func fetch<T: Decodable>
    (request: Request, type:T.Type, callback: @escaping (Result<T, Error>)->Void)  {
        let bundle = Bundle(for: FakeNetworkManager.self)
        guard let path =  bundle.url(forResource: self.fileName, withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: path) else { return }
        let jsonDecoder = JSONDecoder()
        do {
            let responce = try jsonDecoder.decode(type, from: data)
            callback(.success(responce))
        } catch {
            callback(.failure(error))
        }
    }
    
}
