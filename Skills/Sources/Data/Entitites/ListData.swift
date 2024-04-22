//
//  ListElementAPI.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

struct ListData: DataObject {
    let identifier: Int?
    let name: String?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case description
    }
}
