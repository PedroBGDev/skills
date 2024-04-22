//
//  FetchListUseCase.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol FetchListUseCase {
    func fetch() async throws -> [ListElement]
}

typealias FetchListUseCaseError = ListServiceError

enum FetchListUseCaseFactory {
    static func create(service: ListService) -> FetchListUseCase {
        FetchListServiceUseCase(service: service)
    }
}

class FetchListServiceUseCase: FetchListUseCase {
    private let service: ListService

    init(service: ListService) {
        self.service = service
    }

    func fetch() async throws -> [ListElement] {
        return try await service.list()
    }
}
