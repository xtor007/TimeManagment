//
//  Event.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 02.02.2023.
//

import Foundation

struct Event {
    let title: String
    let date: Date
    let type: EventType
}

extension Event {
    static let preview = [
        Event(
            title: "Meet my boyfriend",
            date: .now,
            type: EventTypeData.meeting.data
        ),
        Event(
            title: "Mike's birthday",
            date: Date(timeInterval: 3600 * 24, since: .now),
            type: EventTypeData.partey.data
        ),
        Event(
            title: "JS Lesson",
            date: Date(timeInterval: 3600 * 24 * 4, since: .now),
            type: EventTypeData.learning.data
        ),
        Event(
            title: "Meeting with my mom",
            date: Date(timeInterval: 3600 * 24 * 5, since: .now),
            type: EventTypeData.meeting.data
        ),
        Event(
            title: "JS Lesson",
            date: Date(timeInterval: 3600 * 24 * 7, since: .now),
            type: EventTypeData.learning.data
        )
    ]
}
