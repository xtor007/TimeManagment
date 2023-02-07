//
//  EventList.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct EventList: View {

    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0..<viewModel.events.count, id: \.self) { eventIndex in
                    let event = viewModel.events[eventIndex]
                    if event.date.isSameDay(date: viewModel.date) && event.type == viewModel.type.data {
                        EventView(event: event)
                    }
                }
            }
        }
    }

}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
            .environmentObject(MainViewModel())
    }
}
