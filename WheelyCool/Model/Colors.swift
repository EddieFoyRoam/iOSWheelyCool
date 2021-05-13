//
//  Colors.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import UIKit
import Foundation

var colorArray: Array<ColorPair> = [
    ColorPair(background: .green, text: .black),
    ColorPair(background: .red, text: .white),
    ColorPair(background: .yellow, text: .black),
    ColorPair(background: .blue, text: .white),
    ColorPair(background: .orange, text: .white)
]

struct ColorPair {
    let background: UIColor
    let text: UIColor
}
