//
//  ListMapper.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol ListMapper {
    func mapToList(_ data: ListData) -> ListElement?
}

class ListDataMapper: ListMapper {
    func mapToList(_ data: ListData) -> ListElement? {
        guard let identifier = data.identifier else { return nil }
        guard let name = data.name else { return nil }
        guard let description = data.description else { return nil }
        
        return ListElement(identifier: identifier, name: name, description: description)
    }
}
