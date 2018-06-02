//
//  DrawView.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/1/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    struct Constants {
        static let lineWidth: CGFloat = 5.0
    }
    var lines = [Line]()
    var lastPoint: CGPoint!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let context: CGContext? = UIGraphicsGetCurrentContext()
        context?.beginPath()
        for line in lines {
            context?.move(to: line.start)
            context?.addLine(to: line.end)
        }
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.setLineCap(.round)
        context?.setLineWidth(Constants.lineWidth)
        context?.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let newPoint = touches.first?.location(in: self)
        lines.append(Line(start: lastPoint, end: newPoint!))
        lastPoint = newPoint
        
        self.setNeedsDisplay()
    }
    
}
