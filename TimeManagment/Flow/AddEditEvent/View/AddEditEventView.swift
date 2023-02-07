//
//  AddEditEventView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct AddEditEventView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @StateObject var viewModel: AddEditEventViewModel

    @State var eventTitle = ""

    var body: some View {
        VStack {
            HStack {
                Text(viewModel.title)
                    .foregroundColor(Asset.Colors.foregroundColor.swiftUIColor)
                    .font(.custom(FontFamily.Montserrat.medium, size: 20))
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Asset.Images.closeButtonIcon.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }

            }
            TextField(Strings.ChangeEvent.enterTitle, text: $eventTitle)
            Divider()
        }
        .padding(.horizontal, 16)
        .onTapGesture {
            // Close keyboard
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }

}

struct AddEditEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditEventView(viewModel: AddEditEventViewModel(changeType: .add))
    }
}
