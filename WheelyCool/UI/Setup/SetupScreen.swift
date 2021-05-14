//
//  SetupScreen.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import UIKit

class SetupScreen: UIView {
    
    private let defaults = UserDefaults.standard
    let submitButton = UIButton()
    //TODO make them into a list
    let inputField1 = TextField()
    let inputField2 = TextField()
    let inputField3 = TextField()
    let inputField4 = TextField()
    let inputField5 = TextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setupSubmitButton()
        inputField1.setup(parent: self, fieldAbove: nil, colorPair: colorArray[0], key: defaultsKeys.choice1)
        inputField2.setup(parent: self, fieldAbove: inputField1, colorPair: colorArray[1], key: defaultsKeys.choice2)
        inputField3.setup(parent: self, fieldAbove: inputField2, colorPair: colorArray[2], key: defaultsKeys.choice3)
        inputField4.setup(parent: self, fieldAbove: inputField3, colorPair: colorArray[3], key: defaultsKeys.choice4)
        inputField5.setup(parent: self, fieldAbove: inputField4, colorPair: colorArray[4], key: defaultsKeys.choice5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubmitButton() {
        let margin: CGFloat = 20.0
        submitButton.setTitle(DONE_TITLE, for: [])
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.backgroundColor = BUTTON_COLOR
        addSubview(submitButton)
        NSLayoutConstraint.activate([
            submitButton.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            submitButton.rightAnchor.constraint(equalTo: rightAnchor, constant:  -margin),
            submitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -margin),
            submitButton.heightAnchor.constraint(equalToConstant: BUTTON_HEIGHT)
        ])
        submitButton.applyBorder(color: UIColor.white)
    }
    
}

extension TextField {
    func setup(parent: UIView, fieldAbove: TextField?, colorPair: ColorPair, key: String) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = colorPair.background
        textColor = colorPair.text
        text = UserDefaults.standard.string(forKey: key) ?? ""
        applyBorder(color: UIColor.black)
        parent.addSubview(self)
        let horizontalMargin: CGFloat = 20.0
        let topMargin: CGFloat = 10.0
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: parent.leftAnchor, constant: horizontalMargin),
            rightAnchor.constraint(equalTo: parent.rightAnchor, constant:  -horizontalMargin),
            topAnchor.constraint(equalTo: fieldAbove?.bottomAnchor ?? getParentTop(parent: parent), constant: topMargin)
        ])
    }
    
    func getParentTop(parent: UIView) -> NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return parent.safeAreaLayoutGuide.topAnchor
        } else {
            return parent.topAnchor
        }
    }
}
