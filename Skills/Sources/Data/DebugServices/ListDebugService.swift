//
//  ListDebugService.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

class ListDebugService: ListService {
    private let listFileName: DebugDataFileName = .listFileName
    private let dataLoader: DataLoaderDebugService
    private let dataResultHandler: ListDataResultHandler
    private var didLoadList = false

    init(dataLoader: JsonDataLoader, dataResultHandler: ListDataResultHandler) {
        self.dataLoader = JsonDataLoaderDebugService(dataLoader: dataLoader, fileName: listFileName)
        self.dataResultHandler = dataResultHandler
    }

    func list() async throws -> [ListElement] {
        guard !didLoadList else { throw ListServiceError.emptyData }
        let data: DataWrapper<ListData> = try dataLoader.loadData()
        didLoadList = true
        return try dataResultHandler.handle(data)
    }
}
