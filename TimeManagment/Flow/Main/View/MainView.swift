//
//  MainView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        VStack {
            HStack {
                Text(Strings.Main.calendar)
                    .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                    .font(.custom(FontFamily.Montserrat.medium, size: 20))
                Spacer()
            }
            CalendarView()
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
            HStack {
                Text(Strings.Main.events)
                    .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                    .font(.custom(FontFamily.Montserrat.medium, size: 20))
                Spacer()
            }
            EventTypeList(selectedType: $viewModel.type)
            EventList()
        }
        .padding(.horizontal, 12)
        .padding(.top, 32)
        .background(
            Asset.Colors.backgroundColor.swiftUIColor.ignoresSafeArea()
        )
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainViewModel())
    }
}
