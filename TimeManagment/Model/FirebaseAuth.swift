//
//  FirebaseAuth.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 06.02.2023.
//
import FirebaseAuth
import GoogleSignIn
import Firebase
import SwiftUI

struct FirebaseAuth {
    static let share = FirebaseAuth()
    static var userID: String = ""
    private init() {}
    func signinWithGoogle(presenting: any View,
                          completion: @escaping (Error?) -> Void) -> String {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return "" }
        let config = GIDConfiguration(clientID: clientID)
        var authResult: String = ""
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: presenting.getRootViewController()) { signResult, error in
            if let error = error {
                completion(error)
               return
            }
             guard let user = signResult?.user,
                   let idToken = user.idToken else { return }
             let accessToken = user.accessToken
             let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            Auth.auth().signIn(with: credential) { result, error in
                guard error == nil else {
                    completion(error)
                    return
                }
                authResult = (result?.user.uid)!
                UserDefaults.standard.set(true, forKey: "signIn")
            }
        }
        return authResult
    }
}
