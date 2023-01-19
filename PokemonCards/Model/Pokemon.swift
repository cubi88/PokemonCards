//
//  Pokemon.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import Foundation

struct PokemonListData: Codable, Hashable {
    var data: [Pokemon]
}
struct Pokemon: Codable, Hashable {
    var id: String
    let name: String
    let images: Images
}
struct Images: Codable, Hashable {
    let small: String
    let large: String
}
struct PokemonImageData: Codable, Hashable {
    var data: [String]
}
