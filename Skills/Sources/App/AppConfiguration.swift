//
//  AppConfiguration.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol AppConfigurationDelegate {
    var apiBaseURLString: String { get }
    var scheme: AppScheme { get }
}

class AppConfiguration: AppConfigurationDelegate {
    lazy var scheme: AppScheme = scheme(fromConfigurationKey: "SCHEME")
    lazy var apiBaseURLString: String = apiBaseURLString(fromConfigurationKey: "API_BASE_URL")
}

private extension AppConfiguration {
    func scheme(fromConfigurationKey configurationKey: String) -> AppScheme {
        guard let scheme = AppScheme(rawValue: value(forConfigurationKey: configurationKey)) else {
            fatalError("Scheme value \(String(describing: value)) not in \(String(describing: AppScheme.self))")
        }
        return scheme
    }

    func apiBaseURLString(fromConfigurationKey configurationKey: String) -> String {
        value(forConfigurationKey: configurationKey)
    }

    func value(forConfigurationKey configurationKey: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: configurationKey) as? String else {
            fatalError("Could not retrieve configuration value for key \(configurationKey)")
        }
        return value
    }
}
