//
//  AuthView.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 03.02.2023.
//

import SwiftUI

enum AuthViewShowing {
case login
case signup
}

struct AuthView: View {
    @State private var currentViewShowing: AuthViewShowing = .login // login or signup
    var body: some View {
        if currentViewShowing == .login {
            SignupView(currentViewShowing: $currentViewShowing)
                .preferredColorScheme(.light)
        } else {
            SignupView(currentViewShowing: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
