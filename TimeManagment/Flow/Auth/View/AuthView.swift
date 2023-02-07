//
//  AuthView.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 03.02.2023.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        SignupView(viewModel: SignupViewModel())
            .preferredColorScheme(.light)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
