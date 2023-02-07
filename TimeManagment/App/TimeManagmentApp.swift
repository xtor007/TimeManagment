//
//  TimeManagmentApp.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 31.01.2023.
//

import SwiftUI

@main
struct TimeManagmentApp: App {
    @StateObject var mainViewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mainViewModel)
        }
    }
}
