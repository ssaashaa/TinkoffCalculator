//
//  UIImage+ImageCrop.swift
//  TinkoffCalculatorUITests
//
//  Created by Sasha Stryapkov on 25.02.2024.
//

import UIKit

extension UIImage {
    var removingStatusBar: UIImage? {
        guard let cgImage = cgImage else {
            return nil
        }
        
        var yOffset: CGFloat = 0
        
        switch UIDevice.modelName {
        case "Simulator iPhone 11 Pro",
            "Simulator iPhone XS Max",
            "Simulator iPhone X",
            "Simulator iPhone 12 Pro",
            "Simulator iPhone 12 Pro Max",
            "Simulator iPhone XS",
            "Simulator iPhone 15":
            yOffset = 132
        case "Simulator iPhone XR",
            "Simulator iPhone 12",
            "Simulator iPhone 11":
            yOffset = 88
        case "Simulator iPhone 6 Plus",
            "Simulator iPhone 6S Plus",
            "Simulator iPhone 7 Plus",
            "Simulator iPhone 8 Plus":
            yOffset = 54
        default:
            yOffset = 40
        }
        
        let rect = CGRect(
            x: 0,
            y: Int(yOffset),
            width: cgImage.width,
            height: cgImage.height - Int(yOffset)
        )
        
        if let croppedCGImage = cgImage.cropping(to: rect) {
            return UIImage(cgImage: croppedCGImage, scale: scale, orientation: imageOrientation)
        }
        
        return nil
    }
}
