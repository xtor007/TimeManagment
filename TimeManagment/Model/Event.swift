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
            type: EventType(typeName: "Meeting", color: Asset.Colors.simpleColor)
        ),
        Event(
            title: "Mike's birthday",
            date: Date(timeInterval: 3600 * 24, since: .now),
            type: EventType(typeName: "Partey", color: Asset.Colors.simpleColor)
        ),
        Event(
            title: "JS Lesson",
            date: Date(timeInterval: 3600 * 24 * 4, since: .now),
            type: EventType(typeName: "Learning", color: Asset.Colors.simpleColor)
        ),
        Event(
            title: "Meeting with my mom",
            date: Date(timeInterval: 3600 * 24 * 5, since: .now),
            type: EventType(typeName: "Meeting", color: Asset.Colors.simpleColor)
        ),
        Event(
            title: "JS Lesson",
            date: Date(timeInterval: 3600 * 24 * 7, since: .now),
            type: EventType(typeName: "Learning", color: Asset.Colors.simpleColor)
        )
    ]
}
