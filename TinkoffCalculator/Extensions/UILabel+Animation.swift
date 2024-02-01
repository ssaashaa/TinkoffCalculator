//
//  Extensions.swift
//  TinkoffCalculator
//
//  Created by Sasha Stryapkov on 01.02.2024.
//

import UIKit

extension UILabel {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 5, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 5, y: center.y))
        
        layer.add(animation, forKey: "position")
    }
}
