//
//  JSONParser.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol JSONParser {
    func parse<T: Decodable>(data: Data) -> T?
}

class JSONDecoderParser: JSONParser {
    func parse<T>(data: Data) -> T? where T: Decodable {
        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: data)
    }
}
