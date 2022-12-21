//
//  Fetchable.swift
//  DogBreeds
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import Foundation

protocol Fetchable {
    func fetch<T: Decodable>(request: Request, type:T.Type, callback: @escaping (Result<T, Error>)->Void)
}
