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
    
    override func draw(_ rect: CGRect) {
    }

}
