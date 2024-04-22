//
//  ListDataHandler.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

enum ListDataResultHandlerFactory {
    static func createWithDataMappers() -> ListDataResultHandler {
        ListDataServiceResultHandler(listMapper: listMapper)
    }

    private static var listMapper: ListMapper {
        ListDataMapper()
    }
}

protocol ListDataResultHandler {
    func handle(_ dataWrapper: DataWrapper<ListData>) throws -> [ListElement]
}

class ListDataServiceResultHandler: ListDataResultHandler {
    private let listMapper: ListMapper

    init(listMapper: ListMapper) {
        self.listMapper = listMapper
    }

    func handle(_ dataWrapper: DataWrapper<ListData>) throws -> [ListElement] {
        let list = mapToList(dataWrapper.data)
        
        guard !list.isEmpty else { throw DataServiceError.emptyData }
        return list
    }
}

private extension ListDataServiceResultHandler {
    func mapToList(_ listData: [ListData]?) -> [ListElement] {
        guard let listData = listData else { return [] }
        return listData.compactMap(listMapper.mapToList)
    }
}

