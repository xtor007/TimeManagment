//
//  ContentView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 31.01.2023.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var type = EventTypeData.meeting
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            EventTypeList(selectedType: $type)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
