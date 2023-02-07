//
//  GoogleBtn.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 06.02.2023.
//

import SwiftUI

struct GoogleSiginBtn: View {
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Image("google")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 25)
                Text("Sign In with Google")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .padding()
        .background(.black)
        .cornerRadius(12)
        .padding()
    }
}

struct GoogleSiginBtn_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSiginBtn(action: {})
    }
}
