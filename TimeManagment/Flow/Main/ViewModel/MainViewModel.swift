//
//  MainViewModel.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 02.02.2023.
//

import Foundation

class MainViewModel: ObservableObject {

    @Published var events = Event.preview
    @Published var type = EventTypeData.meeting
    @Published var date = Date.now {
        didSet {
            for event in events where event.date.isSameDay(date: date) {
                for eventType in EventTypeData.allCases where event.type == eventType.data {
                    type = eventType
                    return
                }
            }
        }
    }
    @Published var editingEventIndex = 0

    let userId = "1"

}
