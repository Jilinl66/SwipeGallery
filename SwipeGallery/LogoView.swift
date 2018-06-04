//
//  LogoView.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/3/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

@IBDesignable
class LogoView: UIView {
    
    let lineWidth: CGFloat = 1.0
    var percentage: CGFloat = 0.0
    
    var traceCompleted = false
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let color = UIColor(displayP3Red: 0.882, green: 0.882, blue: 0.851, alpha: 1)
        let gradientColor = UIColor(displayP3Red: 0.157, green: 0.169, blue: 0.208, alpha: 1)
        let gradientColor2 = UIColor(displayP3Red: 0.498, green: 0.498, blue: 0.620, alpha: 1)
        
        let gradient = CGGradient(colorsSpace: nil, colors: [gradientColor.cgColor, gradientColor2.cgColor] as CFArray, locations: [0, 1])!
        
        let rectPath = UIBezierPath(rect: CGRect(x: lineWidth / 2, y: lineWidth / 2, width: bounds.width - lineWidth, height: bounds.height -  lineWidth))
//        context?.saveGState()
//        rectPath.addClip()
        context?.drawLinearGradient(gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: percentage *  bounds.height), options: [])
//        context?.restoreGState()
        color.setStroke()
        rectPath.lineWidth = lineWidth
        rectPath.stroke()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            percentage = location.y / self.frame.size.height
            print(location.y, self.frame.size.height)
            updateDrawing()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateDrawing()
        if percentage >= 1 {
            traceCompleted = true
        }
    }
    
    private func updateDrawing() {
        if !traceCompleted {
            if percentage < 0  {
                percentage = 0
            } else if percentage > 1 {
                percentage = 1
            }
            self.setNeedsDisplay()
        }
    }
}
