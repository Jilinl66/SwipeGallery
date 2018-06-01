//
//  ProgressView.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 5/31/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

@IBDesignable class ProgressView: UIView {

    struct Constants {
        static let pi = CGFloat.pi
        static let numberOfItems = 10
    }
    
    @IBInspectable var counter: Int = 4
    @IBInspectable var fillColor: UIColor = UIColor.yellow
    @IBInspectable var outlineColor: UIColor = UIColor.gray
    @IBInspectable var arcWidth: CGFloat = 75
    @IBInspectable var outlineWidth: CGFloat = 2.5
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = max(bounds.width, bounds.height) / 2
        
        let startAngle = 3 * Constants.pi / 4
        let endAngle = Constants.pi / 4
        
        drawArc(arcCenter: center, radius: radius, arcWidth: arcWidth, startAngle: startAngle, endAngle: endAngle, clockwise: true)
    
        drawOutline(arcCenter: center, radius: radius, outlineWidth: outlineWidth, startAngle: startAngle, endAngle: endAngle)
    }
    
    private func drawArc(arcCenter: CGPoint, radius: CGFloat, arcWidth: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool) {
        // radius is bounds.width / 2 - aarcWidth / 2, stroke is draw outside and inside equally
        let path = UIBezierPath(arcCenter: arcCenter, radius: radius - arcWidth / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        path.lineWidth = arcWidth
        fillColor.setStroke()
        path.stroke()
    }
    
    private func drawOutline(arcCenter: CGPoint, radius: CGFloat, outlineWidth: CGFloat, startAngle: CGFloat, endAngle: CGFloat) {
        let angleDifference = 2 * Constants.pi - (startAngle - endAngle)
        let anglePerItem = angleDifference / CGFloat(Constants.numberOfItems)
        let outlineEndAngle = anglePerItem * CGFloat(counter) + startAngle
        
        // Draw outline path
        let outlinePath = UIBezierPath(arcCenter: arcCenter, radius: radius - outlineWidth / 2, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        outlinePath.addArc(withCenter: arcCenter, radius: radius - arcWidth + outlineWidth / 2, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        outlinePath.close()
        
        outlineColor.setFill()
        outlinePath.lineWidth = CGFloat(outlineWidth)
        outlinePath.fill()
        
    }

}
