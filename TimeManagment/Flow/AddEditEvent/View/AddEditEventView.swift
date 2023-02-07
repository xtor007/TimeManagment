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
    
    @State var willShowingTimePicker = false

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
            TitleTextField(eventTitle: $eventTitle)
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
                    .onTapGesture {
                        willShowingTimePicker = true
                    }
            }
            .padding(.bottom, 24)

            DescriptionTextField(description: $description)
                .padding(.bottom, 24)

            if viewModel.changeType == .edit {
                HStack(spacing: 16) {
                    Asset.Images.deleteEventIcon.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18)
                    Text(Strings.ChangeEvent.delete)
                        .foregroundColor(Asset.Colors.deleteColor.swiftUIColor)
                        .font(.custom(FontFamily.Montserrat.regular, size: 14))
                }
                .onTapGesture {
                    mainViewModel.events.remove(at: mainViewModel.editingEventIndex)
                    presentationMode.wrappedValue.dismiss()
                }
            }

            Spacer()

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
        .sheet(isPresented: $willShowingTimePicker) {
            SelectTimePeriod(timePeriod: $time)
        }
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
