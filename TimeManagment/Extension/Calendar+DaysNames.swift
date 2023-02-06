//
//  Calendar+DaysNames.swift
//  VOCollege
//
//  Created by Anatoliy Khramchenko on 02.12.2022.
//

import Foundation

extension Calendar {

    static var isAdditionalMoveNeeded = false

    var daysNames: [Substring] {
        var days = self.shortStandaloneWeekdaySymbols
        return days.compactMap { day in
            return day.prefix(3)
        }
    }

}
