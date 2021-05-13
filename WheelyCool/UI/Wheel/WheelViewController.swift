//
//  ViewController.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import UIKit

class WheelViewController: UIViewController {
    
    var wheelScreen: WheelScreen!
    var wheelChoices: [WheelChoice] = []
    
    init(wheelChoices: [WheelChoice]) {
        self.wheelChoices = wheelChoices
        self.wheelScreen = WheelScreen(frame: CGRect(), wheelChoices: wheelChoices)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = wheelScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wheelScreen.spinButton.addTarget(self, action: #selector(spinAction), for: .touchUpInside)
        self.title = "SPIN THE WHEEL"
    
        self.wheelScreen.wheelView.onWinnerDetermined = { choice in
            self.wheelScreen.setWinnerDisplay(winner: choice)
        }
    
    }
    
    @objc func spinAction(sender: UIButton!) {
        if(wheelScreen.wheelView.isRotating) {
            wheelScreen.showToast(message: "ISO Violation: please wait!", font: .systemFont(ofSize: 12.0))
        } else {
            wheelScreen.wheelView.rotate(rotationAmount: getRandomSpinAmount())
        }
    }
    
    func getRandomSpinAmount() -> Double {
        return FULL_CIRCLE * Double.random(in: 5.0 ..< 15.0)
    }
    
}

