//
//  SignupView.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 03.02.2023.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @Binding var currentViewShowing: AuthViewShowing
    @AppStorage(Strings.Db.uid) var userID: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    private var foregroundColor: Color {
        return self.currentViewShowing == .signup ? .white : .black
    }
    var body: some View {
        ZStack {
            switch currentViewShowing {
            case .signup:
                Color.black.edgesIgnoringSafeArea(.all)
            case .login:
                Color.white.edgesIgnoringSafeArea(.all)
            }
            VStack {
                HStack {
                    switch currentViewShowing {
                    case .signup:
                        Text(Strings.Signup.createAccount)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                    case .login:
                        Text(Strings.Login.welcomeBack)
                            .font(.largeTitle)
                            .bold()
                    }
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
                .foregroundColor(self.foregroundColor)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(self.foregroundColor)
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
                .foregroundColor(self.foregroundColor)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(self.foregroundColor)
                )
                .padding()
                switch currentViewShowing {
                case .signup:
                    Button(action: {
                        withAnimation {
                            self.currentViewShowing = .login
                        }
                    }) {
                        Text(Strings.Signup.alreadyHave)
                            .foregroundColor(.gray)
                    }
                case .login:
                    Button(action: {
                        withAnimation {
                            self.currentViewShowing = .signup
                        }
                    }) {
                        Text(Strings.Login.createAccount)
                            .foregroundColor(.black.opacity(0.7))
                    }
                }
                Spacer()
                Spacer()
                Button {
                    switch currentViewShowing {
                    case .signup:
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
                    case .login:
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
                    }
                } label: {
                    Text(currentViewShowing == .signup ? Strings.Signup.createNew : Strings.Login.signin)
                        .foregroundColor(currentViewShowing == .signup ? .black : .white)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(self.foregroundColor)
                        )
                        .padding(.horizontal)
                }
            }
        }
    }
}

