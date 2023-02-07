//
//  BottomButton.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct BottomButton: View {

    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(title)
                    .font(.custom(FontFamily.Montserrat.medium, size: 14))
                    .foregroundColor(Asset.Colors.elementBackgroundColor.swiftUIColor)
                Spacer()
            }
            .frame(height: 50)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Asset.Colors.foregroundColor.swiftUIColor)
            }
        }
    }

}

struct BottomButton_Previews: PreviewProvider {
    static var previews: some View {
        BottomButton(title: "Continue") {
            return
        }
    }
}
