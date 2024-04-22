//
//  AppPaths.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation

protocol URLComposer {
    func compose(from baseURL: URL, adding components: RequestComponents) -> URL?
}

class URLComponentsBuilder: URLComposer {
    func compose(from baseURL: URL, adding components: RequestComponents) -> URL? {
        guard components != RequestComponents.empty else { return baseURL }
        let url = buildFullURL(from: baseURL, and: components)
        guard var urlComponents = urlComponents(from: url) else { return nil }
        urlComponents.queryItems = buildQueryItems(from: components)
        return urlComponents.url
    }
}

private extension URLComponentsBuilder {
    func urlComponents(from url: URL) -> URLComponents? {
        URLComponents(url: url, resolvingAgainstBaseURL: false)
    }

    func buildFullURL(from baseURL: URL, and components: RequestComponents) -> URL {
        baseURL.appendingPathComponent(components.path)
    }

    func buildQueryItems(from components: RequestComponents) -> [URLQueryItem] {
        components.queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
