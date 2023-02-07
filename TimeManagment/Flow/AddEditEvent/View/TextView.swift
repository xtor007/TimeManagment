//
//  TextView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct TextView: UIViewRepresentable {

    @Binding var text: String
    let textStyle: UIFont.TextStyle

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()

        textView.font = UIFont.preferredFont(forTextStyle: textStyle)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true

        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
}
