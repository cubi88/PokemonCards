//
//  NetworkManager.swift
//  Json external
//
//  Created by Tsvetelina Cholakova on 19/12/2022.


import Foundation

class NetworkManager: Fetchable {
    func fetch<T: Decodable>
    (request: Request, type:T.Type, callback: @escaping (Result<T, Error>)->Void)  {
        var urlComponnets = URLComponents(string: request.baseUrl + request.path)
        var queryItems:[URLQueryItem] = []
        for (k, v) in request.params {
            queryItems.append( URLQueryItem(name: k, value: v))
        }
        urlComponnets?.queryItems = queryItems
        
        let urlsesson = URLSession.shared
        
        guard let url = urlComponnets?.url
        else {
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let dataTask = urlsesson.dataTask(with: urlRequest) {
            data, response, error in   //escaping closure
            let jsonDecoder = JSONDecoder()
            
            do {
                let response = try
                jsonDecoder.decode(type, from: data!)
                callback(.success(response))
            } catch {
                callback(.failure(error))
            }
        }
        dataTask.resume()
    }
    
}




