//
//  AppPaths.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol NetworkSession {
    func loadData(from request: URLRequest) async throws -> (data: Data, response: URLResponse)
}
