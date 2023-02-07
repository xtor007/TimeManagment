//
//  ScannerView.swift
//  TimeManagment
//
//  Created by Illia Kniaziev on 07.02.2023.
//

import SwiftUI
import AVFoundation

struct ScannerView: View {

    @Binding var code: String
    @State private var isTorchOn = false
    @EnvironmentObject private var permissionManager: PermissonManager

    private let viewfinderWidth = UIScreen.main.bounds.width * 0.8

    var body: some View {
        ZStack {
            BarcodeScanner(recognizedItems: $code)
            overlay()
        }
        .ignoresSafeArea()
        .task {
            await permissionManager.requestPermission()
        }
    }

    @ViewBuilder
    private func overlay() -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("viewfinderBackground"))

            VStack(spacing: 25) {
                Rectangle()
                    .cornerRadius(18)
                    .blendMode(.destinationOut)
                // compensate broken image offset
                    .frame(width: viewfinderWidth - 2, height: viewfinderWidth - 2)
                    .overlay {
                        Image("viewfinder")
                            .resizable()
                            .frame(width: viewfinderWidth, height: viewfinderWidth)
                    }

                Text("scanner.title")
                    .font(.custom(FontFamily.Montserrat.medium, size: 18))
                    .foregroundColor(.white)
            }
        }
        .compositingGroup()
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(code: .constant(""))
            .environmentObject(PermissonManager())
    }
}
