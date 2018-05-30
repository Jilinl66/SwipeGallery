//
//  ViewController.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 5/29/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        guard let card = sender.view else {
            Log.logger.error("No attached view to tap gesture")
        }
        
    }
}

