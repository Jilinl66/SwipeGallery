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
    var drawColor = UIColor.black
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let context: CGContext? = UIGraphicsGetCurrentContext()
        context?.setLineCap(.round)
        context?.setLineWidth(Constants.lineWidth)
        for line in lines {
            context?.beginPath()
            context?.move(to: line.start)
            context?.addLine(to: line.end)
            context?.setStrokeColor(line.color.cgColor)
            context?.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let newPoint = touches.first?.location(in: self)
        lines.append(Line(start: lastPoint, end: newPoint!, color: drawColor))
        lastPoint = newPoint
        
        self.setNeedsDisplay()
    }
    
}
