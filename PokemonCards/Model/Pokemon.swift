//
//  Pokemon.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import Foundation

struct PokemonListData: Decodable, Hashable {
    var data: [Pokemon]
}
struct Pokemon: Decodable, Hashable {
    var id: String
    let name: String
    let images: Images
    var smallImageUrl: URL? {
        return URL(string: images.small)
    }
    var largeImageUrl: URL? {
        return URL(string: images.large)
    }
}
struct Images: Decodable, Hashable {
    let small: String
    let large: String
}
struct PokemonImageData: Decodable, Hashable {
    var data: [String]
}
