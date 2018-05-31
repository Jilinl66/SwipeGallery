//
//  DesignablePlusButton.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 5/31/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

@IBDesignable class DesignablePlusButton: UIButton {
    @IBInspectable var fillColor: UIColor = UIColor.blue
    @IBInspectable var pathColor: UIColor = UIColor.white
    @IBInspectable var isAddButton: Bool = true
    
    override func draw(_ rect: CGRect) {
        // Draw circle
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        //Draw sign
        drawSign()
    }
    
    func drawSign() {
        drawHorizontalDash()
        if isAddButton {
            drawVerticalDash()
        }
    }
    
    func drawHorizontalDash() {
        let horizontalWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        let horizontalHeight: CGFloat = 3.0
        
        let horizontalPath = UIBezierPath()
        horizontalPath.lineWidth = horizontalHeight
        horizontalPath.move(to: CGPoint(x: bounds.width / 2 - horizontalWidth / 2, y: bounds.height / 2))
        horizontalPath.addLine(to: CGPoint(x: bounds.width / 2 + horizontalWidth / 2, y: bounds.height / 2))
        
        pathColor.setStroke()
        horizontalPath.stroke()
    }
    
    func drawVerticalDash() {
        let verticalWidth: CGFloat = 3.0
        let verticalHeight: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        let verticalPath = UIBezierPath()
        verticalPath.lineWidth = verticalWidth
        verticalPath.move(to: CGPoint(x: bounds.width / 2, y: bounds.height / 2 - verticalHeight / 2))
        verticalPath.addLine(to: CGPoint(x: bounds.width / 2 , y: bounds.height / 2 + verticalHeight / 2))
        
        pathColor.setStroke()
        verticalPath.stroke()
    }
}
