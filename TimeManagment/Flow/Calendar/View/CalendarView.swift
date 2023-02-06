//
//  CalendarView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 02.02.2023.
//

import SwiftUI

struct CalendarView: View {

    @EnvironmentObject var viewModel: MainViewModel

    @State private var currentMonth = 0

    var body: some View {
        VStack(spacing: 16) {

            HStack {

                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                }

                Spacer()

                Text(viewModel.date.monthDescription)
                    .font(.custom(FontFamily.Montserrat.regular, size: 16))
                    .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)

                Spacer()

                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                }

            }
            .padding(.horizontal, 8)

            HStack {
                ForEach(Calendar.current.daysNames, id: \.self) { dayName in
                    Text(dayName)
                        .font(.custom(FontFamily.Montserrat.medium, size: 14))
                        .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                        .frame(maxWidth: .infinity)
                }
            }

            let columns = Array(repeating: GridItem(.flexible()), count: Calendar.current.daysNames.count)
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(Date.extractDate(monthDifference: currentMonth), id: \.self) { value in
                    cardView(value: value)
                        .onTapGesture {
                            viewModel.date = value.date
                        }
                }
            }

        }
        .onChange(of: currentMonth) { _ in
            viewModel.date = Date.getCurrentMonth(monthDifference: currentMonth)
        }
    }

    @ViewBuilder
    private func cardView(value: DateValue) -> some View {
        ZStack {
            if value.day != -1 {
                if viewModel.date.isSameDay(date: value.date) {
                    VStack {
                        Circle()
                            .fill(
                                Color(Asset.Colors.pickColor.color.withAlphaComponent(0.2))
                            )
                            .frame(width: 20, height: 20)
                            .overlay(
                                Circle()
                                    .stroke(
                                        Asset.Colors.foregroundColor.swiftUIColor,
                                        lineWidth: 1
                                    )
                            )
                        Spacer()
                    }
                    .padding(.vertical, 8)
                }
                VStack {
                    Text("\(value.day)")
                        .font(.custom(FontFamily.Montserrat.regular, size: 14))
                        .foregroundColor(
                            Asset.Colors.foregroundColor.swiftUIColor
                        )
                    Spacer()
                    if let todayEvent = viewModel.events.first { event in
                        event.date.isSameDay(date: value.date)
                    } {
                        Circle()
                            .fill(todayEvent.type.color.swiftUIColor)
                            .frame(width: 5, height: 5)
                    }
                }
                .padding(.vertical, 8)
            }
        }
    }

}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CalendarView()
                .environmentObject(MainViewModel())
            Spacer()
        }
    }
}
