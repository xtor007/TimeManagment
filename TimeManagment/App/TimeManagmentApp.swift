//
//  TimeManagmentApp.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 31.01.2023.
//

import SwiftUI
import FirebaseCore

@main
struct TimeManagmentApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
