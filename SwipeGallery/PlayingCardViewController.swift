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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1 ... 4 {
            if let card = deck.draw() {
                print(card)
            }
        }
    }

}
