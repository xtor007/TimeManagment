//
//  TimeManagmentApp.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 31.01.2023.
//

import SwiftUI

@main
struct TimeManagmentApp: App {

    @StateObject private var permissionManager = PermissonManager()

    var body: some Scene {
        WindowGroup {
            ScannerView(code: .constant(""))
                .environmentObject(permissionManager)
        }
    }
}
