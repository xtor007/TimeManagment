//
//  EventTypeList.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 06.02.2023.
//

import SwiftUI

struct EventTypeList: View {

    var contentInset: CGFloat = 0
    @Binding var selectedType: EventTypeData

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                Color.clear.frame(width: contentInset)

                HStack(spacing: 8) {
                    ForEach(EventTypeData.allCases, id: \.self) { typeData in
                        let isSelected = Binding {
                            return selectedType == typeData
                        } set: { newValue, _ in
                            if newValue {
                                selectedType = typeData
                            }
                        }
                        EventTypeElement(type: typeData.data, isSelected: isSelected)
                            .padding(.vertical, 4)
                            .onTapGesture {
                                selectedType = typeData
                            }
                    }
                }

                Color.clear.frame(width: contentInset)
            }
        }
    }

}

struct EventTypeList_Previews: PreviewProvider {
    static var previews: some View {
        EventTypeList(selectedType: .constant(EventTypeData.learning))
    }
}
