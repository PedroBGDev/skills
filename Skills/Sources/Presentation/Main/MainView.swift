//
//  ContentView.swift
//  Skills
//
//  Created by Pedro Juan Baeza Gómez on 21/4/24.
//

import SwiftUI

@main
struct MainView: App {
    private let viewModel: MainViewModelProtocol = MainViewModel(coordinator: MainFactory.create())
    
    var body: some Scene {
        WindowGroup {
            AnyView(viewModel.nextView())
        }
    }
}
