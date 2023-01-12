//
//  UseCase.swift
//  KudaGo
//
//  Created by Alexey Ivanov on 12.01.2023.
//

import Foundation

protocol UseCase {
    
    associatedtype Response
    
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    var queryItems: [String : String] { get }
    
    func map(_ data: Data) throws -> Response
}

extension UseCase where Response: Decodable {
    
    func map(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}

extension UseCase {
    
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [:]
    }
}
