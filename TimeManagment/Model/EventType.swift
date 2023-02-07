//
//  EventType.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 02.02.2023.
//

import Foundation

struct EventType: Equatable {

    let typeName: String
    let color: ColorAsset

    static func == (lhs: EventType, rhs: EventType) -> Bool {
        return lhs.typeName == rhs.typeName
    }

}
