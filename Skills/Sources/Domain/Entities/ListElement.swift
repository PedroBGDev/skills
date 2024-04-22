//
//  ListElement.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

public struct ListElement: Equatable {
    public let identifier: Int
    public let name: String
    public let description: String

    public init(identifier: Int, name: String, description: String) {
        self.identifier = identifier
        self.name = name
        self.description = description
    }
}
