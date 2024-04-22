//
//  ListCoordinator.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation
import SwiftUI

class ListCoordinator: Coordinator {
    weak var delegate: CoordinatorDelegate?
    var children: [Coordinator]

    private let dependencyContainer: ListDependencies

    init(dependencyContainer: ListDependencies) {
        self.children = []
        self.dependencyContainer = dependencyContainer
    }

    func nextView() -> AnyView {
        return AnyView(ListView())
    }
}
