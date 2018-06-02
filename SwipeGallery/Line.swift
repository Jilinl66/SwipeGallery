//
//  Line.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/1/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class Line {
    
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    init(start: CGPoint, end: CGPoint, color: UIColor) {
        self.start = start
        self.end = end
        self.color = color
    }
}
