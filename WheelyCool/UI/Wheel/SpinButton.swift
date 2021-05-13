//
//  SpinButton.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import UIKit

class SpinButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = BUTTON_COLOR
        setTitle("Spin", for: [])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
