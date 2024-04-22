//
//  MainCoordinator.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import Foundation
import SwiftUI

enum MainFactory {
    static func create() -> Coordinator {
        let appDependencyContainer = MainDependencyContainer(configuration: AppConfiguration())
        return MainCoordinator(dependencyContainer: appDependencyContainer)
    }
}

class MainCoordinator: Coordinator {
    weak var delegate: CoordinatorDelegate?
    var children: [Coordinator]

    private let dependencyContainer: AppDependencyContainer

    init(dependencyContainer: AppDependencyContainer) {
        self.children = []
        self.dependencyContainer = dependencyContainer
    }

    func nextView() -> AnyView {
        let listDependencies = ListDependenciesAdapter(
            baseApiURL: dependencyContainer.baseApiURL,
            scheme: dependencyContainer.scheme
        )
        let listCoordinator = ListCoordinator(
            dependencyContainer: listDependencies
        )
        
        children.append(listCoordinator)
        return listCoordinator.nextView()
    }
}
