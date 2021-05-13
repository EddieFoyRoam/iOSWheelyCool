//
//  SetupScreen.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import UIKit

class SetupScreen: UIView {
    
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
        inputField1.setup(parent: self, fieldAbove: nil, colorPair: colorArray[0])
        inputField2.setup(parent: self, fieldAbove: inputField1, colorPair: colorArray[1])
        inputField3.setup(parent: self, fieldAbove: inputField2, colorPair: colorArray[2])
        inputField4.setup(parent: self, fieldAbove: inputField3, colorPair: colorArray[3])
        inputField5.setup(parent: self, fieldAbove: inputField4, colorPair: colorArray[4])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubmitButton() {
        let margin: CGFloat = 20.0
        submitButton.setTitle("Done", for: [])
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.backgroundColor = BUTTON_COLOR
        addSubview(submitButton)
        NSLayoutConstraint.activate([
            submitButton.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            submitButton.rightAnchor.constraint(equalTo: rightAnchor, constant:  -margin),
            submitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -margin),
            submitButton.heightAnchor.constraint(equalToConstant: BUTTON_HEIGHT)
        ])
    }
    
}

extension UITextField {
    func setup(parent: UIView, fieldAbove: UITextField?, colorPair: ColorPair) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = colorPair.background
        self.textColor = colorPair.text
        parent.addSubview(self)
        let horizontalMargin: CGFloat = 20.0
        let topMargin: CGFloat = 10.0
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: parent.leftAnchor, constant: horizontalMargin),
            self.rightAnchor.constraint(equalTo: parent.rightAnchor, constant:  -horizontalMargin),
            self.topAnchor.constraint(equalTo: fieldAbove?.bottomAnchor ?? getParentTop(parent: parent), constant: topMargin)
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
