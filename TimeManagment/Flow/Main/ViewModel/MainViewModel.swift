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
    @Published var date = Date.now

    let userId = "1"

}
