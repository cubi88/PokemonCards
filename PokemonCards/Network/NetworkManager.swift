//
//  NetworkManager.swift
//  Json external
//
//  Created by Tsvetelina Cholakova on 19/12/2022.


import Foundation
import Combine
enum NetworkError: Error {
    case parsingFailed
    case invalidUrl
    case dataNotFound
}

class NetworkManager: Fetchable {
    func get(url: URL) async throws -> Data {
        do {
            let (data, _) = try await  URLSession.shared.data(from: url)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
