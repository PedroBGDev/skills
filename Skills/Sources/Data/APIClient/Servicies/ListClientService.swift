//
//  ListClientService.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

class ListClientService: ListService {
    private let listPath = AppAPIPaths.list.rawValue
    private let networkService: NetworkService
    private let dataHandler: NetworkDataHandler
    private let dataResultHandler: ListDataResultHandler
    private let networkErrorHandler: NetworkErrorHandler

    init(
        networkService: NetworkService,
        dataHandler: NetworkDataHandler,
        networkErrorHandler: NetworkErrorHandler,
        dataResultHandler: ListDataResultHandler
    ) {
        self.networkService = networkService
        self.networkErrorHandler = networkErrorHandler
        self.dataHandler = dataHandler
        self.dataResultHandler = dataResultHandler
    }

    func list() async throws -> [ListElement] {
        do {
            return try await requestList()
        } catch let networkError as NetworkError {
            throw networkErrorHandler.handle(networkError)
        } catch {
            throw ListServiceError.emptyData
        }
    }
}

private extension ListClientService {
    func components() -> RequestComponents {
        RequestComponents(path: listPath)
    }

    func requestList() async throws -> [ListElement] {
        let data = try await networkService.request(endpoint: components())
        let dataWrapper: DataWrapper<ListData> = try dataHandler.handle(data)
        return try dataResultHandler.handle(dataWrapper)
    }
}
