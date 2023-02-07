//
//  TimePeriod.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import Foundation

struct TimePeriod: Hashable {

    let start: Time
    let finish: Time

    var description: String {
        return "\(start.description)-\(finish.description)"
    }

}

struct Time: Hashable {

    let hours: Int
    let minutes: Int

    var description: String {
        var hoursLine = "\(hours)"
        if hoursLine.count < 2 {
            hoursLine = "0\(hoursLine)"
        }
        var minutesLine = "\(minutes)"
        if minutesLine.count < 2 {
            minutesLine = "0\(minutesLine)"
        }
        return "\(hoursLine):\(minutesLine)"
    }

    init(hours: Int, minutes: Int) {
        self.hours = 0...23 ~= hours ? hours : 0
        self.minutes = 0...60 ~= minutes ? minutes : 0
    }

}
