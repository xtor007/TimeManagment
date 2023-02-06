//
//  Date+IsSameDay.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 02.02.2023.
//

import Foundation

extension Date {

    func isSameDay(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }

}
