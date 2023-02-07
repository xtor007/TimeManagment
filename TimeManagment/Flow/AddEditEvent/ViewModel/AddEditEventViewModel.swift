//
//  AddEditEventViewModel.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import Foundation

class AddEditEventViewModel: ObservableObject {

    let changeType: ChangeEventType

    var title: String {
        switch changeType {
        case .add:
            return Strings.ChangeEvent.add
        case .edit:
            return Strings.ChangeEvent.edit
        }
    }

    init(changeType: ChangeEventType) {
        self.changeType = changeType
    }

}
