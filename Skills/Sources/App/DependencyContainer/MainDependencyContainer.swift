//
//  MainDependencyContainer.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol AppDependencyContainer {
    var baseApiURL: URL { get }
    var scheme: AppScheme { get }
}

class MainDependencyContainer: AppDependencyContainer {
    private let configuration: AppConfigurationDelegate

    init(configuration: AppConfigurationDelegate) {
        self.configuration = configuration
    }

    lazy var baseApiURL: URL = baseURL
    lazy var scheme: AppScheme = configuration.scheme
}

private extension MainDependencyContainer {
    var baseURL: URL {
        guard let url = URL(string: "https://" + configuration.apiBaseURLString) else {
            fatalError("Expected a valid API base URL.")
        }
        return url
    }
}
