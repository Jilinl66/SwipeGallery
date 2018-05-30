//
//  ViewController.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 5/29/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var thumbImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        guard let card = sender.view else {
            Log.logger.error("No attached view to tap gesture")
            return
        }
        let point = sender.translation(in: card)
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        let xFromCenter = card.center.x - view.center.x
        if xFromCenter > 0 { // Swipe to the right
            thumbImageView.image = #imageLiteral(resourceName: "thumb-up")
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "thumb-down")
        }
        
        thumbImageView.alpha = abs(xFromCenter)/view.center.x
        
        if sender.state == .ended {
            // Animation card off the screen
            let threshold = CGFloat(75)
            let offset = card.bounds.width
            let gravityOffset = CGFloat(75)
            if card.center.x < threshold {
                UIView.animate(withDuration: 0.3, animations: {
                   card.center = CGPoint(x: card.center.x - offset, y: card.center.y + gravityOffset)
                    card.alpha = 0
                })
                return
            } else if card.center.x > view.frame.width - threshold {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + offset, y: card.center.y + gravityOffset)
                    card.alpha = 0
                })
                return
            }
            
            // Reset to center position
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.view.center
                self.thumbImageView.alpha = 0
            })
        }
    }
    
}

