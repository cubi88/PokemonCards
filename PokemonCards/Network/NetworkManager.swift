//
//  NetworkManager.swift
//  Json external
//
//  Created by Tsvetelina Cholakova on 19/12/2022.


import Foundation
import Combine

struct NetworkManager {
    let urlSession: Networking
    init(urlSession: Networking = URLSession.shared) {
        self.urlSession = urlSession
    }
}
extension NetworkManager: Fetchable {
    func get(url: URL) async throws -> Data {
        do {
            let (data, _) = try await  urlSession.data(from: url)
            return data
        } catch {
            throw NetworkError.dataNotFound
        }
    }
}
