//
//  PermissionsManager.swift
//  TimeManagment
//
//  Created by Illia Kniaziev on 07.02.2023.
//

import AVKit
import VisionKit

final class PermissonManager: ObservableObject {

    enum ScannerPermisionType: String {
        case none = "Let the app access the camera"
        case cameraAccessNotAllowed = "Grant the camera usage permission in settings"
        case cameraNotAvailable = "The camera is not available"
        case hardwareIncometable = "The device has no scanner ability"
        case allGood = "Everything is ready to go"
    }
    
    @Published var scannerPermissionStatus: ScannerPermisionType = .none
    
    @MainActor
    func requestPermission() async {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            scannerPermissionStatus = .cameraAccessNotAllowed
            return
        }
        
        let isScannerAvailable = DataScannerViewController.isAvailable && DataScannerViewController.isSupported
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            scannerPermissionStatus = isScannerAvailable ? .allGood : .hardwareIncometable
        case .restricted, .denied:
            scannerPermissionStatus = .cameraAccessNotAllowed
        case .notDetermined:
            let isAllowed = await AVCaptureDevice.requestAccess(for: .video)
            if isAllowed {
                scannerPermissionStatus = isScannerAvailable ? .allGood : .hardwareIncometable
            } else {
                scannerPermissionStatus = .cameraAccessNotAllowed
            }
        @unknown default:
            break
        }
    }
    
}
