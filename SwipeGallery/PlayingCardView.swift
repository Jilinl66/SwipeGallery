//
//  PlayingCardView.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/5/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

@IBDesignable
class PlayingCardView: UIView {
    
    var suit: String = "❤️"
    var rank: Int = 2
    var isFaceUp = false
    
    func centeredAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.font: font, .paragraphStyle: paragraphStyle])
    }
    
    var cornerString: NSAttributedString {
        return centeredAttributedString(String(rank)+"\n"+suit, fontSize: 0.0)
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height), cornerRadius: 16.0)
        UIColor.white.setFill()
        path.fill()
    }
}


