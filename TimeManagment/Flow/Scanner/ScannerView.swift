//
//  ScannerView.swift
//  TimeManagment
//
//  Created by Illia Kniaziev on 07.02.2023.
//

import SwiftUI

struct ScannerView: View {
    
    @Binding var code: String
    @EnvironmentObject private var permissionManager: PermissonManager
    
    var body: some View {
        ZStack {
            Overlay()
            BarcodeScanner(recognizedItems: $code)
        }
        .task {
            await permissionManager.requestPermission()
        }
    }
    
    @ViewBuilder
    private func Overlay() -> some View {
        EmptyView()
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(code: .constant(""))
    }
}
