//
//  ListService.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

typealias ListServiceError = DataServiceError

protocol ListService {
    func list() async throws -> [ListElement]
}
