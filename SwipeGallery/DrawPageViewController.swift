//
//  DrawPageViewController.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/1/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class DrawPageViewController: UIViewController {
    
    @IBOutlet weak var drawView: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clearButtonClicked(_ sender: Any) {
        drawView.lines = []
        drawView.setNeedsDisplay()
    }

}
