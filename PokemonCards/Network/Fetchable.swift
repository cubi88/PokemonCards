//
//  Fetchable.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import Foundation

protocol Fetchable {
    func get(url: URL) async throws -> Data
}
