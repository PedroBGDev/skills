//
//  ListDependencyContainer.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol ListDependencies {
    var baseApiURL: URL { get }
    var scheme: AppScheme { get }
}

protocol ListContainer {
    var fetchListUseCase: FetchListUseCase { get }
}

class ListDependenciesAdapter: ListDependencies {
    let baseApiURL: URL
    let scheme: AppScheme

    init(baseApiURL: URL, scheme: AppScheme) {
        self.baseApiURL = baseApiURL
        self.scheme = scheme
    }
}

class ListDependencyContainer: ListContainer {
    private let dependencies: ListDependencies

    init(dependencies: ListDependencies) {
        self.dependencies = dependencies
    }

    lazy var fetchListUseCase = FetchListUseCaseFactory.create(service: listService)
}

private extension ListDependencyContainer {
    var listService: ListService {
        switch dependencies.scheme {
        case .debug:
            return ListServiceFactory.createDebug()
        case .stage, .release:
            return ListServiceFactory.create(with: dependencies.baseApiURL)
        }
    }
}
