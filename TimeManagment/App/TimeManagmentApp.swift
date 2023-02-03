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
    @AppStorage(Strings.Db.uid) var userID: String = ""
    var body: some Scene {
        WindowGroup {
            if userID == "" {
                AuthView()
            } else {
                Text("\(Strings.Temp.loggedin) \(userID)")
                Button(action: {
                    let firebaseAuth = Auth.auth()
                    do {
                        try firebaseAuth.signOut()
                        withAnimation {
                            userID = ""
                        }
                    } catch let signOutError as NSError {
                        print(Strings.Temp.errorAuth, signOutError)
                    }
                }) {
                    Text(Strings.Signout.signout)
                }
            }
        }
    }
    init() {
        FirebaseApp.configure()
    }
}
