//
//  PongDashLine.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/2/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class PongDashLine: UIView {
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let dash: [CGFloat] = [5, 5]
        context?.setLineDash(phase: 0.0, lengths: dash)
        context?.setLineWidth(bounds.width * 2)
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.move(to: CGPoint(x: 0.0, y: 0.0))
        context?.addLine(to: CGPoint(x: 0.0, y: bounds.height))
        context?.strokePath()
    }
}
