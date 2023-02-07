//
//  AddEditEventView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct AddEditEventView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var mainViewModel: MainViewModel

    @ObservedObject var viewModel: AddEditEventViewModel

    @State var eventTitle = ""
    @State var eventType = EventTypeData.meeting
    @State var date = Date.now
    @State var time = TimePeriod(
        start: Time(hours: 7, minutes: 0),
        finish: Time(hours: 8, minutes: 0)
    )
    @State var description = ""

    var body: some View {
        VStack(alignment: .leading) {

            HStack {
                Text(viewModel.title)
                    .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                    .font(.custom(FontFamily.Montserrat.medium, size: 20))
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Asset.Images.closeButtonIcon.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
            }
            TextField(Strings.ChangeEvent.enterTitle, text: $eventTitle)
                .font(.custom(FontFamily.Montserrat.regular, size: 16))
                .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
            Divider()
                .padding(.bottom, 24)

            Text(Strings.ChangeEvent.chooseCategories)
                .font(.custom(FontFamily.Montserrat.medium, size: 14))
                .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
            EventTypeList(selectedType: $eventType)
                .padding(.bottom, 24)

            HStack {
                Asset.Images.chooseDateIcon.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 19)
                DatePicker(
                    "",
                    selection: $date,
                    in: Date.now...Date(timeIntervalSinceNow: 3600 * 24 * 365),
                    displayedComponents: [.date]
                )
                .preferredColorScheme(.light)
            }
            HStack {
                Asset.Images.chooseTimeIcon.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                Spacer()
                Text(time.description)
                    .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
            }
            .padding(.bottom, 24)

            Text(Strings.ChangeEvent.description)
                .font(.custom(FontFamily.Montserrat.medium, size: 14))
                .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
            TextView(text: $description, textStyle: .callout)
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
                .padding(.bottom, 24)

            BottomButton(title: viewModel.buttonTitle) {
                guard !eventTitle.isEmpty else {
                    return
                }
                let newEvent = Event(
                    title: eventTitle,
                    date: date,
                    time: time,
                    description: description,
                    type: eventType.data,
                    authorId: mainViewModel.userId
                )
                switch viewModel.changeType {
                case .add:
                    mainViewModel.events.append(newEvent)
                case .edit:
                    mainViewModel.events[mainViewModel.editingEventIndex] = newEvent
                }
                presentationMode.wrappedValue.dismiss()
            }

        }
        .padding(.horizontal, 16)
        .padding(.top, 20)
        .background(
            Asset.Colors.backgroundColor.swiftUIColor.ignoresSafeArea()
        )
        .onTapGesture {
            // Close keyboard
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .onAppear {
            if viewModel.changeType == .edit {
                let event = mainViewModel.events[mainViewModel.editingEventIndex]
                eventTitle = event.title
                date = event.date
                time = event.time
                description = event.description
                for type in EventTypeData.allCases where type.data == event.type {
                    eventType = type
                    return
                }
            }
        }
    }

}

struct AddEditEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditEventView(viewModel: AddEditEventViewModel(changeType: .add))
    }
}
