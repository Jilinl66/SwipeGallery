//
//  StatsPageViewController.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 5/31/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class StatsPageViewController: UIViewController {

    @IBOutlet weak var animationButton: UIButton!
    @IBOutlet weak var progressView: ProgressView!
    
    var isAnimating: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func animationButtonClicked(_ sender: Any) {
        if !isAnimating {
            isAnimating = true
            let opts: UIViewAnimationOptions = .autoreverse
            UIView.animate(withDuration: 2, delay: 0, options: opts, animations: {
                self.progressView.counter = ProgressView.Constants.numberOfItems
            }, completion: nil)
        } else {
            isAnimating = false
        }
    }
    
}
