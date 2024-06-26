//
//  NetworkDataHandler.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol NetworkDataHandler {
    func handle<T: DataObject>(_ data: Data?) throws -> DataWrapper<T>
}

class ClientDataHandler: NetworkDataHandler {
    private let parser: JSONParser

    init(parser: JSONParser) {
        self.parser = parser
    }

    func handle<T: DataObject>(_ data: Data?) throws -> DataWrapper<T> {
        guard let data = data, let dataWrapper: DataWrapper<T> = parser.parse(data: data) else {
            throw DataServiceError.emptyData
        }
        return dataWrapper
    }
}
