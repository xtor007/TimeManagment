//
//  TabBarView.swift
//  TimeManagment
//
//  Created by Anatoliy Khramchenko on 07.02.2023.
//

import SwiftUI

struct TabBarView: View {

    var connectByCodeAction: () -> Void = {}
    var connectByQRAction: () -> Void = {}
    var addEvent: () -> Void = {}

    var body: some View {
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
        .background {
            Color.white
                .clipShape(TopRoundCornersShape(cornerRadius: 25))
        }
    }
}

private struct TopRoundCornersShape: Shape {

    var cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: cornerRadius,
                                height: cornerRadius))
        return Path(path.cgPath)
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
