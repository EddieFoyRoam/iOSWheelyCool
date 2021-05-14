//
//  WheelScreen.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import UIKit

class WheelScreen: UIView {
    
    var wheelView: WheelView!
    let spinButton = SpinButton()
    let winnerLabel = UILabel()
    
    init(frame: CGRect, wheelChoices: [WheelChoice]) {
        super.init(frame: frame)
        backgroundColor = .lightGray

        setDefaultWinnerLabel()
        wheelView = WheelView(frame: frame, wheelChoices: wheelChoices)
        let arrowView = setUpArrowView()

        addSubview(wheelView)
        addSubview(winnerLabel)
        addSubview(spinButton)
        addSubview(arrowView)
        
        let margin: CGFloat = 40.0
        NSLayoutConstraint.activate([
            wheelView.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            wheelView.rightAnchor.constraint(equalTo: rightAnchor, constant:  -margin),
            wheelView.heightAnchor.constraint(equalTo: wheelView.widthAnchor),
            wheelView.centerYAnchor.constraint(equalTo: centerYAnchor),
            winnerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            winnerLabel.rightAnchor.constraint(equalTo: rightAnchor, constant:  -margin),
            winnerLabel.bottomAnchor.constraint(equalTo: wheelView.topAnchor),
            winnerLabel.topAnchor.constraint(equalTo: topAnchor),
            spinButton.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            spinButton.rightAnchor.constraint(equalTo: rightAnchor, constant:  -margin),
            spinButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin),
            spinButton.heightAnchor.constraint(equalToConstant: BUTTON_HEIGHT),
            arrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowView.leftAnchor.constraint(equalTo:wheelView.rightAnchor, constant: -margin/2),
        ])
    }
    
    private func setDefaultWinnerLabel() {
        winnerLabel.translatesAutoresizingMaskIntoConstraints = false
        winnerLabel.text = ""
        winnerLabel.textAlignment = .center
        winnerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        winnerLabel.textColor = .black
        winnerLabel.numberOfLines = 4
    }
    
    private func setUpArrowView() -> UIImageView {
        let arrowSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 50, weight: .thin)
        let arrowImage = UIImage(systemName: "arrowtriangle.left.fill", withConfiguration: arrowSymbolConfiguration)
        let arrowView = UIImageView(image: arrowImage!)
        arrowView.tintColor = UIColor.black
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        return arrowView
    }
    
    func setSpinButtonText(text: String) {
        spinButton.setTitle(text, for: [])
    }
    
    func setWinnerDisplay(winner: WheelChoice) {
        self.backgroundColor = winner.colors.background.withAlphaComponent(0.7)
        winnerLabel.textColor = winner.colors.text
        winnerLabel.text = String(format: "%@ has been chosen!", winner.name)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
