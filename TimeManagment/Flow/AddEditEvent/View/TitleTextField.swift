//
//  TitleTextField.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct TitleTextField: View {
    @Binding var eventTitle: String
    var body: some View {
        VStack {
            TextField(Strings.ChangeEvent.enterTitle, text: $eventTitle)
                .font(.custom(FontFamily.Montserrat.regular, size: 16))
                .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
            Divider()
        }
    }
}
