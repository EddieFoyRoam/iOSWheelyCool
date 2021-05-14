//
//  NameLabel.swift
//  WheelyCool
//
//  Created by Edward Foy on 12/5/21.
//

import UIKit

class NameLabel: UILabel {
    
    private var name = "ISO Restricted"
    private var angle = CGFloat.pi / 2
    
    init(frame: CGRect, name: String, angle: CGFloat, textColor: UIColor){
        super.init(frame: frame)
        self.name = name
        self.angle = angle
        self.textColor = textColor
        textAlignment = .right
        setAnchorPoint(anchorPoint: CGPoint(x:0, y:0.5), view: self)
    }
    
    override func draw(_ rect: CGRect) {
        text = name
        let insets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        drawText(in: rect.inset(by: insets))
        transform = CGAffineTransform(rotationAngle: self.angle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAnchorPoint(anchorPoint: CGPoint, view: UIView) {
        var newPoint = CGPoint(x: view.bounds.size.width * anchorPoint.x, y: view.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPoint(x: view.bounds.size.width * view.layer.anchorPoint.x, y: view.bounds.size.height * view.layer.anchorPoint.y)
        newPoint = newPoint.applying(view.transform)
        oldPoint = oldPoint.applying(view.transform)
        var position : CGPoint = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x;
        position.y -= oldPoint.y;
        position.y += newPoint.y;
        view.layer.position = position;
        view.layer.anchorPoint = anchorPoint;
    }
    
}
