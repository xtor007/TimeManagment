//
//  SignupViewModel.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 06.02.2023.
//
import FirebaseAuth
import GoogleSignIn
import Firebase
import SwiftUI

final class SignupViewModel {
    func signinWithGoogle(presenting: any View, completion: @escaping (Result<AuthDataResult?, Error>) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)

        GIDSignIn.sharedInstance.signIn(withPresenting: presenting.getRootViewController()) { signResult, error in
            if let error {
                completion(.failure(error))
                return
            }

            guard
                let user = signResult?.user,
                let idToken = user.idToken
            else { return }

            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)

            Auth.auth().signIn(with: credential) { result, error in
                if let error {
                    completion(.failure(error))
                    return
                }

                completion(.success(result))
                UserDefaults.standard.set(true, forKey: "signIn")
            }
        }
    }
}
