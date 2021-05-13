//
//  WheelChoice.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import Foundation

class WheelChoice {
    let name: String
    let colors: ColorPair
    var startValue: Double = -1.0
    var endValue: Double = -1.0
    
    init(name: String, colors: ColorPair) {
        self.name = name
        self.colors = colors
    }
    
    func setValues(start: Double, end: Double) {
        startValue = start
        endValue = end
    }
}
