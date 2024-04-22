//
//  NetworkErrorHandler.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol NetworkErrorHandler {
    func handle(_ networkError: NetworkError) -> DataServiceError
}

class DataServicesNetworkErrorHandler: NetworkErrorHandler {
    func handle(_ networkError: NetworkError) -> DataServiceError {
        switch networkError {
        case .notConnected:
            return .noConnection
        case .unauthorized:
            return .unauthorized
        default:
            return .emptyData
        }
    }
}
