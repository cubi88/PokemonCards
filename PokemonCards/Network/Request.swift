//
//  Request.swift
//  Json external
//
//  Created by Tsvetelina Cholakova on 19/12/2022.
//

import Foundation
struct Request {
    let baseUrl: String
    let path: String
    let params:[String:String]
    let type: String
    let header: [String: String]
}
