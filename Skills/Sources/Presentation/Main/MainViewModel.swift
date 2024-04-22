//
//  MainViewModel.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 22/4/24.
//

import SwiftUI

protocol MainViewModelProtocol: ViewModel {
    func nextView() -> AnyView
}

class MainViewModel: ObservableObject, MainViewModelProtocol {
    
    private var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func nextView() -> AnyView {
        return coordinator.nextView()
    }
}
