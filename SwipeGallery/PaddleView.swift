//
//  PaddleVIew.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/2/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

// Paddle Widget that doesn't come from Xcode by default

class PaddleView: UIView {

    override func draw(_ rect: CGRect) {
        let square = CGRect(x: 0, y: 0, width: 10, height: 60)
        UIColor.white.setFill()
        UIRectFill(square)
    }
}
