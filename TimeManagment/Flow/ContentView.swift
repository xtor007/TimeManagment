//
//  ContentView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 31.01.2023.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @AppStorage(Strings.Db.uid) var userID: String = ""
    var body: some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
