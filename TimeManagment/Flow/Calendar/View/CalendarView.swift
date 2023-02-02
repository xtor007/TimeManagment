//
//  CalendarView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 02.02.2023.
//

import SwiftUI

struct CalendarView: View {

    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }

}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(MainViewModel())
    }
}
