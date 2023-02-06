//
//  EventTypeElement.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 06.02.2023.
//

import SwiftUI

struct EventTypeElement: View {

    let type: EventType
    @Binding var isSelected: Bool

    var body: some View {
        Text(type.typeName)
            .font(.custom(FontFamily.Montserrat.medium, size: 14))
            .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
            .padding(8)
            .padding(.horizontal, 12)
            .background(
                Capsule()
                    .fill(type.color.swiftUIColor)
                    .shadow(
                        color: Asset.Colors.foregroundColor.swiftUIColor,
                        radius: isSelected ? 2 : 0
                    )
            )
    }

}

struct EventTypeElement_Previews: PreviewProvider {
    static var previews: some View {
        EventTypeElement(type: EventTypeData.learning.data, isSelected: .constant(true))
    }
}
