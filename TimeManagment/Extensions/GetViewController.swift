//
//  GetViewController.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 06.02.2023.
//

import SwiftUI

extension View {
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }

        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}
