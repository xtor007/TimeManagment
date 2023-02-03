//
//  LoginView.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 03.02.2023.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @Binding var currentShowingView: AuthViewShowing
    @AppStorage(Strings.Db.uid) var userID: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
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
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
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
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding()
                Button(action: {
                    withAnimation {
                        self.currentShowingView = .signup
                    }
                }) {
                    Text(Strings.Login.createAccount)
                        .foregroundColor(.black.opacity(0.7))
                }
                Spacer()
                Spacer()
                Button {
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        if let authResult = authResult {
                            print(authResult.user.uid)
                            withAnimation {
                                userID = authResult.user.uid
                            }
                        }
                    }
                } label: {
                    Text(Strings.Login.signin)
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        )
                        .padding(.horizontal)
                }
            }
        }
    }
}
