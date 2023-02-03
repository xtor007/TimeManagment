//
//  SignupView.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 03.02.2023.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @AppStorage(Strings.Db.uid) var userID: String = ""
    @Binding var currentShowingView: AuthViewShowing
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text(Strings.Signup.createAccount)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding()
                .padding(.top)
                Spacer()
                HStack {
                    Image(systemName: Strings.Icon.email)
                    TextField(Strings.Placeholder.email, text: $email)
                    Spacer()
                    if email.count != 0 {
                        Image(systemName: email.isValidEmail() ? Strings.Icon.checkmark : Strings.Icon.xmark)
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                }
                .foregroundColor(.white)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                )
                .padding()
                HStack {
                    Image(systemName: Strings.Icon.lock)
                    SecureField(Strings.Placeholder.password, text: $password)
                    Spacer()
                    if password.count != 0 {
                        Image(systemName: password.isValidPassword() ? Strings.Icon.checkmark : Strings.Icon.xmark)
                            .fontWeight(.bold)
                            .foregroundColor(password.isValidPassword() ? .green : .red)
                    }
                }
                .foregroundColor(.white)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                )
                .padding()
                Button(action: {
                    withAnimation {
                        self.currentShowingView = .login
                    }
                }) {
                    Text(Strings.Signup.alreadyHave)
                        .foregroundColor(.gray)
                }
                Spacer()
                Spacer()
                Button {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        if let authResult = authResult {
                            print(authResult.user.uid)
                            userID = authResult.user.uid
                        }
                    }
                } label: {
                    Text(Strings.Signup.createNew)
                        .foregroundColor(.black)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                        )
                        .padding(.horizontal)
                }
            }
        }
    }
}
