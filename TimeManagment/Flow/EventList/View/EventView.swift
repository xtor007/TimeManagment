//
//  EventView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct EventView: View {

    @EnvironmentObject var viewModel: MainViewModel
    let event: Event
    let editAction: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.date.dayDescription)
                    .foregroundColor(Asset.Colors.secondaryForegroundColor.swiftUIColor)
                    .font(.custom(FontFamily.Montserrat.regular, size: 12))
                Spacer()
                Text(event.title)
                    .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                    .font(.custom(FontFamily.Montserrat.regular, size: 14))
                Spacer()
                Text(event.description)
                    .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                    .font(.custom(FontFamily.Montserrat.regular, size: 12))
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(event.time.description)
                    .foregroundColor(Asset.Colors.secondaryForegroundColor.swiftUIColor)
                    .font(.custom(FontFamily.Montserrat.regular, size: 12))
                Spacer()
                if event.authorId == viewModel.userId {
                    Button {
                        editAction()
                    } label: {
                        Asset.Images.editButtonIcon.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    }
                }
            }
        }
        .frame(height: 100)
        .padding(16)
    }

}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event.preview[0]) {
            return
        }
            .environmentObject(MainViewModel())
    }
}
