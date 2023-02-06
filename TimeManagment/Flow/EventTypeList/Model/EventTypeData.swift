//
//  EventTypeData.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 06.02.2023.
//

import Foundation

enum EventTypeData: CaseIterable {

    var data: EventType {
        switch self {
        case .meeting:
            return EventType(typeName: Strings.EventType.meeting, color: Asset.Colors.meetingColor)
        case .partey:
            return EventType(typeName: Strings.EventType.partey, color: Asset.Colors.parteyColor)
        case .learning:
            return EventType(typeName: Strings.EventType.learning, color: Asset.Colors.learningColor)
        case .shoping:
            return EventType(typeName: Strings.EventType.shoping, color: Asset.Colors.shopingColor)
        case .walking:
            return EventType(typeName: Strings.EventType.walking, color: Asset.Colors.walkingColor)
        case .funning:
            return EventType(typeName: Strings.EventType.funning, color: Asset.Colors.funningColor)
        case .sport:
            return EventType(typeName: Strings.EventType.sport, color: Asset.Colors.sportColor)
        }
    }

    case meeting, partey, learning, shoping, walking, funning, sport

}
