//
//  CustomTextField.swift
//  TimeManagment
//
//  Created by Берлинский Ярослав Владленович on 07.02.2023.
//

import SwiftUI

struct CustomTextField: View {
    private var name: String = ""
    private var icon: String = ""
    var body: some View {
        HStack {
            Image(systemName: Strings.Icon.email)
            TextField(Strings.Placeholder.email, text: self.name)
            Spacer()
            if self.name.count != 0 {
                Image(systemName: self.name.isValidEmail() ? Strings.Icon.checkmark : Strings.Icon.xmark)
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
    }
    init(name: String, icon: String) {
        self.icon = icon
        self.name = name
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField()
    }
}
