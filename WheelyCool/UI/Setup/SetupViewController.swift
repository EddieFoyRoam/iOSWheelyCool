//
//  SetupViewController.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import Foundation
import UIKit

class SetupViewController: UIViewController {
    
    private var wheelChoices: [WheelChoice] = []
    private let setupScreen: SetupScreen = SetupScreen()
    private let defaults = UserDefaults.standard

    override func loadView() {
        self.view = setupScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen.submitButton.addTarget(self, action: #selector(goToWheel), for: .touchUpInside)
        title = SETUP_TITLE
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped)), animated: false)

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
        addNameFromField(field: setupScreen.inputField1, key: defaultsKeys.choice1)
        addNameFromField(field: setupScreen.inputField2, key: defaultsKeys.choice2)
        addNameFromField(field: setupScreen.inputField3, key: defaultsKeys.choice3)
        addNameFromField(field: setupScreen.inputField4, key: defaultsKeys.choice4)
        addNameFromField(field: setupScreen.inputField5, key: defaultsKeys.choice5)
    }
    
    func addNameFromField(field: UITextField, key: String) {
        if let name = field.text {
            if(name.isEmpty == false) {
                wheelChoices.append(
                    WheelChoice(name: name, colors: ColorPair(background: field.backgroundColor ?? .black, text: field.textColor ?? .white))
                )
            }
            defaults.set(name, forKey: key)
        }
    }
    
    @objc func doneTapped(){
        setupScreen.inputField1.resignFirstResponder()
        setupScreen.inputField2.resignFirstResponder()
        setupScreen.inputField3.resignFirstResponder()
        setupScreen.inputField4.resignFirstResponder()
        setupScreen.inputField5.resignFirstResponder()
    }
    
}
