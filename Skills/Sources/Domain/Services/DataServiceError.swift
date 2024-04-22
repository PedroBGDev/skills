//
//  DataServiceError.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

public enum DataServiceError: Error {
    case emptyData
    case unauthorized
    case noConnection
}
