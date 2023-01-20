//
//  NetworkError.swift
//  PokemonCards
//
//  Created by Tsvetelina Cholakova on 20/01/2023.
//

import Foundation

enum NetworkError: Error {
    case parsingFailed
    case invalidUrl
    case dataNotFound
}
