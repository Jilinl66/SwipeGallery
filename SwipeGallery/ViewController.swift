//
//  ViewController.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 5/29/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        guard let card = sender.view else {
            Log.logger.error("No attached view to tap gesture")
            return
        }
        let point = sender.translation(in: view)
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)

        let xFromCenter = card.center.x - view.center.x
        
        // Rotate the card
        let divisor = (view.frame.width / 2) / (35 * CGFloat.pi / 180)
        let scaleThreshold = CGFloat(120)
        let scale = min(scaleThreshold/abs(xFromCenter), 1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor).scaledBy(x: scale, y: scale)
        
        // Change thumb and down image
        if xFromCenter > 0 { // Swipe to the right
            thumbImageView.image = #imageLiteral(resourceName: "thumb-up")
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "thumb-down")
        }
        
        // Set up alpha based on position
        thumbImageView.alpha = abs(xFromCenter)/view.center.x
        
        if sender.state == .ended {
            // Animation card off the screen
            let threshold = CGFloat(75)
            let offset = card.bounds.width / 2
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
            resetCard()
        }
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        resetCard()
    }
    
    private func resetCard() {
        UIView.animate(withDuration: 0.2, animations: {
            self.card.center = self.view.center
            self.card.alpha = 1
            self.thumbImageView.alpha = 0
            self.card.transform = CGAffineTransform.identity
        })
    }
}
