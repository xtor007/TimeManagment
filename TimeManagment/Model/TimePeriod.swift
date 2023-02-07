//
//  TimePeriod.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import Foundation

struct TimePeriod {
    let start: Time
    let finish: Time
}

struct Time {

    let hours: Int
    let minutes: Int

    init(hours: Int, minutes: Int) {
        self.hours = 0...23 ~= hours ? hours : 0
        self.minutes = 0...60 ~= minutes ? minutes : 0
    }

}
