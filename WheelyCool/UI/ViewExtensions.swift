//
//  ViewExtensions.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import UIKit

extension UIView {
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: frame.size.width/2 - 75, y: frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func applyBorder(color: UIColor) {
        layer.cornerRadius = CORNER_RADIUS
        layer.borderWidth = BORDER_WIDTH
        layer.borderColor = color.cgColor
    }
    
}
