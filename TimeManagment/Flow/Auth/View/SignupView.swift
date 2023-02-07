//
//  SignupView.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 03.02.2023.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct SignupView: View {

    let viewModel: SignupViewModel

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Text(Strings.Login.welcomeBack)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding()
                .padding(.top)

                Image("authImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Spacer()

                GoogleSiginBtn {
                    viewModel.signinWithGoogle(presenting: self) { result in
                        switch result {
                        case .success(let success):
                            print(success?.user.uid)
                        case .failure(let failure):
                            print(failure)
                        }
                    }
                }
            }
        }
    }
}
