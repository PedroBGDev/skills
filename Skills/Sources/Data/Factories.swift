//
//  Factories.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol ServiceFactory {
    associatedtype Service
    static func createDebug() -> Service
    static func create(with baseApiURL: URL) -> Service
}

extension ServiceFactory {
    static func networkService(baseApiURL: URL) -> NetworkService {
        NetworkSessionService(
            session: URLSession.shared,
            baseURL: baseApiURL,
            urlComposer: URLComponentsBuilder()
        )
    }

    static var dataHandler: NetworkDataHandler {
        ClientDataHandler(parser: parser)
    }

    static var parser: JSONParser {
        JSONDecoderParser()
    }

    static var errorHandler: NetworkErrorHandler {
        DataServicesNetworkErrorHandler()
    }

    static var listDataResultHandler: ListDataResultHandler {
        ListDataResultHandlerFactory.createWithDataMappers()
    }
}

enum ListServiceFactory: ServiceFactory {
    typealias Service = ListService
    
    static func createDebug() -> Service {
        ListDebugService(
            dataLoader: JsonDecoderDataLoader(parser: parser),
            dataResultHandler: listDataResultHandler
        )
    }

    static func create(with baseApiURL: URL) -> Service {
        ListClientService(
            networkService: networkService(baseApiURL: baseApiURL),
            dataHandler: ClientDataHandler(parser: parser),
            networkErrorHandler: errorHandler,
            dataResultHandler: listDataResultHandler
        )
    }
}
