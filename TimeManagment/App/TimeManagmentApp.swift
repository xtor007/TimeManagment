//
//  TimeManagmentApp.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 31.01.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct TimeManagmentApp: App {
    @AppStorage("signIn") var isSignIn = false
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            if !isSignIn {
                AuthView()
            } else {
                Text("\(Strings.Temp.loggedin)")
                Button(action: {
                    let firebaseAuth = Auth.auth()
                   do {
                     try firebaseAuth.signOut()
                   } catch let signOutError as NSError {
                     print("Error signing out: %@", signOutError)
                   }
                    UserDefaults.standard.set(false, forKey: "signIn")
                }) {
                    Text(Strings.Signout.signout)
                }
            }
        }
    }

}
