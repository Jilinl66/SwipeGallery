//
//  PlayingCardViewController.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/5/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class PlayingCardViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizerBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }

    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.suit = card.suit.rawValue
            playingCardView.rank = card.rank.order
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
