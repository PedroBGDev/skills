//
//  Coordinator.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import SwiftUI

protocol NextView {
    func nextView() -> AnyView
}

protocol CoordinatorDelegate: AnyObject {
    func coordinatorDidFinish(_ coordinator: Coordinator)
}

protocol Coordinator: NextView, CoordinatorDelegate {
    var delegate: CoordinatorDelegate? { get }
    var children: [Coordinator] { get set }
}

extension Coordinator {
    func coordinatorDidFinish(_ coordinator: Coordinator) {
        disposeChild(coordinator)
    }

    func disposeChild(_ child: Coordinator?) {
        for (index, coordinator) in children.enumerated() {
            guard coordinator === child else { continue }
            children.remove(at: index)
        }
    }
}
