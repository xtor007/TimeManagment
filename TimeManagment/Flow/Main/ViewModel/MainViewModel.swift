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
            for event in events {
                if event.date.isSameDay(date: date) {
                    for eventType in EventTypeData.allCases {
                        if event.type == eventType.data {
                            type = eventType
                            return
                        }
                    }
                }
            }
        }
    }

    let userId = "1"

}
