//
//  WheelView.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import UIKit

class WheelView: UIView {
    var isRotating = false
    private var startValue = 0.0
    private var wheelChoices: [WheelChoice] = []
    var onWinnerDetermined: ((_ choice: WheelChoice) -> Void)!
    
    init(frame: CGRect, wheelChoices: [WheelChoice]) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        isOpaque = false
        self.wheelChoices = wheelChoices
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ frame: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        let radius = min(frame.size.width, frame.size.height) * 0.5
        let viewCenter = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let size = wheelChoices.count
        for (index, element) in wheelChoices.enumerated() {
            drawWheelPart(ctx: ctx, radius: radius, viewCenter: viewCenter, index: index, size: size, wheelChoice: element)
        }
    }
    
    func getPie(index: Int, total: Int) -> CGFloat {
        return CGFloat.init(Float(index) * 2.0/Float(total)) * CGFloat.pi
    }
    
    func drawWheelPart(ctx: CGContext, radius: CGFloat, viewCenter: CGPoint, index: Int, size: Int, wheelChoice: WheelChoice) {
        let startAngle = getPie(index: index, total: size)
        let endAngle = getPie(index: index+1, total: size)
        let midPointAngle = (startAngle + endAngle) / 2.0

        wheelChoice.setValues(start: Double(startAngle), end: Double(endAngle))
        
        ctx.setFillColor(wheelChoice.colors.background.cgColor)
        ctx.move(to: viewCenter)
        ctx.addArc(center: viewCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        ctx.fillPath()
        
        let nameLabelFrame = CGRect(x: viewCenter.x, y: viewCenter.y, width: CGFloat(radius), height:CGFloat(24))
        let nameLabel = NameLabel(frame: nameLabelFrame, name: wheelChoice.name, angle: midPointAngle, textColor: wheelChoice.colors.text)
        addSubview(nameLabel)
    }
    
    func rotate(rotationAmount: Double) {
        let endValue = startValue + rotationAmount
        isRotating = true
        CATransaction.begin()
        let rotation : CABasicAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
        rotation.fromValue = NSNumber(value: startValue)
        rotation.toValue = NSNumber(value: endValue)
        rotation.duration = 3
        rotation.isCumulative = true
        rotation.fillMode = CAMediaTimingFillMode.forwards
        rotation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        rotation.isRemovedOnCompletion = false
        
        CATransaction.setCompletionBlock {  [weak self] in
            guard let self = self else { return }
            self.isRotating = false
            self.startValue = endValue.truncatingRemainder(dividingBy: FULL_CIRCLE)
            self.determineWinner(winningValue: FULL_CIRCLE - self.startValue)
        }
        layer.add(rotation, forKey: "rotationAnimation")
        CATransaction.commit()
    }
    
    func determineWinner(winningValue: Double) {
        for wheelChoice in wheelChoices {
            if(winningValue >= wheelChoice.startValue && winningValue < wheelChoice.endValue) {
                onWinnerDetermined?(wheelChoice)
                return
            }
        }
        print("wtfhappened")
    }
}
