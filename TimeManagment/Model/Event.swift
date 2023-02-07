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
    let time: TimePeriod
    let description: String
    let type: EventType
    let authorId: String
}

extension Event {
    static let preview = [
        Event(
            title: "Meet my friends",
            date: .now,
            time: TimePeriod(
                start: Time(hours: 10, minutes: 15),
                finish: Time(hours: 11, minutes: 45)
            ),
            description: "Go to caffee",
            type: EventTypeData.meeting.data,
            authorId: "3"
        ),
        Event(
            title: "Meet Mike",
            date: .now,
            time: TimePeriod(
                start: Time(hours: 13, minutes: 0),
                finish: Time(hours: 13, minutes: 30)
            ),
            description: "Go to shop",
            type: EventTypeData.meeting.data,
            authorId: "1"
        ),
        Event(
            title: "Meet my boyfriend",
            date: .now,
            time: TimePeriod(
                start: Time(hours: 18, minutes: 0),
                finish: Time(hours: 21, minutes: 0)
            ),
            description: "Go to cinema",
            type: EventTypeData.meeting.data,
            authorId: "1"
        ),
        Event(
            title: "Mike's birthday",
            date: Date(timeInterval: 3600 * 24, since: .now),
            time: TimePeriod(
                start: Time(hours: 15, minutes: 0),
                finish: Time(hours: 22, minutes: 0)
            ),
            description: "Buy present",
            type: EventTypeData.partey.data,
            authorId: "2"
        ),
        Event(
            title: "JS Lesson",
            date: Date(timeInterval: 3600 * 24 * 4, since: .now),
            time: TimePeriod(
                start: Time(hours: 10, minutes: 0),
                finish: Time(hours: 11, minutes: 0)
            ),
            description: "Express",
            type: EventTypeData.learning.data,
            authorId: "1"
        ),
        Event(
            title: "Meeting with my mom",
            date: Date(timeInterval: 3600 * 24 * 5, since: .now),
            time: TimePeriod(
                start: Time(hours: 12, minutes: 0),
                finish: Time(hours: 13, minutes: 30)
            ),
            description: "Buy flowers",
            type: EventTypeData.meeting.data,
            authorId: "1"
        ),
        Event(
            title: "JS Lesson",
            date: Date(timeInterval: 3600 * 24 * 7, since: .now),
            time: TimePeriod(
                start: Time(hours: 10, minutes: 0),
                finish: Time(hours: 11, minutes: 0)
            ),
            description: "Express",
            type: EventTypeData.learning.data,
            authorId: "1"
        )
    ]
}
