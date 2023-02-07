//
//  DescriptionTextField.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct DescriptionTextField: View {
    @Binding var description: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(Strings.ChangeEvent.description)
                .font(.custom(FontFamily.Montserrat.medium, size: 14))
                .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
            TextField(Strings.ChangeEvent.descriptionPlaceholder, text: $description)
                .font(.custom(FontFamily.Montserrat.regular, size: 16))
                .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Asset.Colors.elementBackgroundColor.swiftUIColor)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(
                                    Asset.Colors.borderColor.swiftUIColor,
                                    lineWidth: 1
                                )
                        }
                )
        }
    }
}
