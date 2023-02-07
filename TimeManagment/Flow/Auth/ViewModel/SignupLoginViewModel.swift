//
//  SignupView.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 03.02.2023.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct SignUpLogin: View {
    static var userID: String = ""
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
                    FirebaseAuth.share.signinWithGoogle(presenting: self)
                    { error in }
                }
            }
        }
    }
}
