//
//  SelectTimePeriod.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct SelectTimePeriod: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @Binding var timePeriod: TimePeriod

    @State var startDate = Date.now
    @State var finishDate = Date.now

    var body: some View {
        VStack {
            HStack {
                Text(Strings.SelectTimePeriod.start)
                    .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                DatePicker(
                    "",
                    selection: $startDate,
                    displayedComponents: [.hourAndMinute]
                )
                .preferredColorScheme(.light)
            }
            HStack {
                Text(Strings.SelectTimePeriod.finish)
                    .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                DatePicker(
                    "",
                    selection: $finishDate,
                    displayedComponents: [.hourAndMinute]
                )
                .preferredColorScheme(.light)
            }
            BottomButton(title: Strings.ChangeEvent.continue) {
                guard startDate < finishDate else {
                    return
                }
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding(.horizontal, 16)
        .background(Asset.Colors.elementBackgroundColor.swiftUIColor.ignoresSafeArea())
        .onChange(of: startDate) { _ in
            updateTime()
        }
        .onChange(of: finishDate) { _ in
            updateTime()
        }
    }

    private func updateTime() {
        let calendar = Calendar.current
        let hourStart = calendar.component(.hour, from: startDate)
        let minuteStart = calendar.component(.minute, from: startDate)
        let hourFinish = calendar.component(.hour, from: finishDate)
        let minuteFinish = calendar.component(.minute, from: finishDate)
        timePeriod = TimePeriod(
            start: Time(hours: hourStart, minutes: minuteStart),
            finish: Time(hours: hourFinish, minutes: minuteFinish)
        )
    }

}

struct SelectTimePeriod_Previews: PreviewProvider {
    static var previews: some View {
        SelectTimePeriod(timePeriod: .constant(TimePeriod(
            start: Time(hours: 0, minutes: 0),
            finish: Time(hours: 0, minutes: 0)
        )))
    }
}
