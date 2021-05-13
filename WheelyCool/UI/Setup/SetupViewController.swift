//
//  SetupViewController.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import Foundation
import UIKit

class SetupViewController: UIViewController {
    
    var wheelChoices: [WheelChoice] = []
    
    private let setupScreen: SetupScreen = SetupScreen()
    
    override func loadView() {
        self.view = setupScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen.submitButton.addTarget(self, action: #selector(goToWheel), for: .touchUpInside)
        self.title = "Add Wheel Choices"
    }
    
    @objc func goToWheel() {
        populateNames()
        if(wheelChoices.isEmpty) {
            setupScreen.showToast(message: "ISO Violation: add more!", font: .systemFont(ofSize: 12.0))
            return
        }
        navigationController?.pushViewController(WheelViewController(wheelChoices: wheelChoices), animated: true)
    }
    
    func populateNames() {
        wheelChoices.removeAll()
        addNameFromField(field: setupScreen.inputField1)
        addNameFromField(field: setupScreen.inputField2)
        addNameFromField(field: setupScreen.inputField3)
        addNameFromField(field: setupScreen.inputField4)
        addNameFromField(field: setupScreen.inputField5)
    }
    
    func addNameFromField(field: UITextField) {
        if let name = field.text, name.isEmpty == false {
            wheelChoices.append(
                WheelChoice(name: name, colors: ColorPair(background: field.backgroundColor ?? .black, text: field.textColor ?? .white))
            )
        }
    }
    
}
