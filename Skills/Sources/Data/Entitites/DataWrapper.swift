//
//  DataWrapper.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

struct DataWrapper<ContentType: DataObject>: DataObject {
    let code: Int?
    let status: String?
    let copyright: String?
    let data: [ContentType]?
}
