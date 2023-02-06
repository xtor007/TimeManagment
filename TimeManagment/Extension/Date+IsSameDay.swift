//
//  Date+IsSameDay.swift
//  VOCollege
//
//  Created by Anatoliy Khramchenko on 25.11.2022.
//

import Foundation

extension Date {

    func isSameDay(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: date)
    }

}
