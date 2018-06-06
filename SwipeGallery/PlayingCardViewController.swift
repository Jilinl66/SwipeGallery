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
        }
    }

    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.suit = card.suit.rawValue
            playingCardView.rank = card.rank.order
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
