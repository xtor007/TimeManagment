//
//  TabBarView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct TabBarView: View {

    let connectByCodeAction: () -> Void
    let connectByQRAction: () -> Void
    let addEvent: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Asset.Colors.elementBackgroundColor.swiftUIColor)
                .offset(y: 20)
            HStack {
                Spacer()
                Button {
                    connectByCodeAction()
                } label: {
                    Asset.Images.connectByCodeButtonIcon.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
                Spacer()
                Button {
                    addEvent()
                } label: {
                    Asset.Images.addEventButtonIcon.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56)
                        .offset(y: -20)
                }
                Spacer()
                Button {
                    connectByQRAction()
                } label: {
                    Asset.Images.qrButtonIcon.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
                Spacer()
            }
        }
        .frame(height: 100)
    }

}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView {
            return
        } connectByQRAction: {
            return
        } addEvent: {
            return
        }
        .background(Color.red)
    }
}
