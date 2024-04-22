//
//  DataLoaderDebugService.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol DataLoaderDebugService {
    func loadData<T: DataObject>() throws -> DataWrapper<T>
}

class JsonDataLoaderDebugService: DataLoaderDebugService {
    private let fileName: DebugDataFileName
    private let dataLoader: JsonDataLoader

    init(dataLoader: JsonDataLoader, fileName: DebugDataFileName) {
        self.dataLoader = dataLoader
        self.fileName = fileName
    }

    func loadData<T: DataObject>() throws -> DataWrapper<T> {
        guard let data: DataWrapper<T> = dataLoader.load(fromFileNamed: fileName.rawValue) else {
            throw DataServiceError.emptyData
        }
        return data
    }
}
