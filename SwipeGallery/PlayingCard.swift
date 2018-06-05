//
//  PlayingCard.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/5/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import Foundation

struct PlayingCard {
    var suit: Suit
    var rank: Rank
    
    enum Suit: String {
        case spades = "♠"
        case dimonds = "♦"
        case heart = "♥"
        case clubs = "♣"
        
        static var all = [Suit.spades, .dimonds, .heart, .clubs]
    }
    
    enum Rank {
        case ace
        case numeric(Int)
        case face(String)
        
        var order: Int {
            switch self {
            case .ace:
                return 1
            case .numeric(let pips):
                return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default:
                return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2 ... 10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), Rank.face("Q"), Rank.face("K")]
            return allRanks
        }
    }
}


