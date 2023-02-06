//
//  Date+GetAllDates.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 02.02.2023.
//

import Foundation

struct DateValue: Hashable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

extension Date {

    var allDates: [Date] {

        let calendar = Calendar.current

        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!

        let range = calendar.range(of: .day, in: .month, for: startDate)!

        return range.compactMap { day -> Date in
            return calendar.date(
                byAdding: .day,
                value: day - 1,
                to: startDate
            )!
        }

    }

    static func extractDate(monthDifference: Int) -> [DateValue] {
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth(monthDifference: monthDifference)
        var days = currentMonth.allDates.compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date.now)
        var emptyDaysCount = Calendar.isAdditionalMoveNeeded ? firstWeekday - 2 : firstWeekday - 1
        if emptyDaysCount < 0 {
            emptyDaysCount = 7 + emptyDaysCount
        }
        for _ in 0..<emptyDaysCount {
            days.insert(DateValue(day: -1, date: Date.now), at: 0)
        }
        return days
    }

    static func getCurrentMonth(monthDifference: Int) -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(
            byAdding: .month,
            value: monthDifference,
            to: Date.now
        ) else {
            return Date.now
        }
        return currentMonth
    }

}
