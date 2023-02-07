//
//  MainView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject var viewModel: MainViewModel

    @State var willAddEvent = false
    @State var willEditEvent = false

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Text(Strings.Main.calendar)
                            .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                            .font(.custom(FontFamily.Montserrat.medium, size: 20))
                        Spacer()
                    }
                    .padding(.horizontal, 12)

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
                        .padding(.horizontal, 12)

                    HStack {
                        Text(Strings.Main.events)
                            .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                            .font(.custom(FontFamily.Montserrat.medium, size: 20))
                        Spacer()
                    }
                    .padding(.horizontal, 12)
                    EventTypeList(selectedType: $viewModel.type)
                    EventList { editingEventIndex in
                        viewModel.editingEventIndex = editingEventIndex
                        willEditEvent = true
                    }
                        .frame(height: UIScreen.main.bounds.height * 0.4)
                        .padding(.horizontal, 12)
                }
            }
            .padding(.top, 32)

            TabBarView {
                print("code")
            } connectByQRAction: {
                print("qr")
            } addEvent: {
                willAddEvent = true
            }
        }
        .background(
            Asset.Colors.backgroundColor.swiftUIColor.ignoresSafeArea()
        )
        .ignoresSafeArea(edges: .bottom)
        .fullScreenCover(isPresented: $willAddEvent, content: {
            AddEditEventView(viewModel: AddEditEventViewModel(changeType: .add))
        })
        .fullScreenCover(isPresented: $willEditEvent, content: {
            AddEditEventView(viewModel: AddEditEventViewModel(changeType: .edit))
        })
        .ignoresSafeArea(edges: .top)
    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainViewModel())
    }
}
