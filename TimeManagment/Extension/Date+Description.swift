//
//  Date+GetDescription.swift
//  VOCollege
//
//  Created by Anatoliy Khramchenko on 24.11.2022.
//

import Foundation

extension Date {

    var monthDescription: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: self)
    }

    var dayDescription: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM"
        return formatter.string(from: self)
    }

}
