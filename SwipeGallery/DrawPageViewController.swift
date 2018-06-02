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
    
    @IBAction func colorChanged(_ sender: UIButton) {
        if let title = sender.title(for: .normal) {
            var color: UIColor
            switch title {
            case "Red":
                color = UIColor.red
                break
            case "Blue":
                color = UIColor.blue
                break
            case "Yellow":
                color = UIColor.yellow
                break
            case "Black":
                color = UIColor.black
                break
            default:
                color = UIColor.black
                break
            }
            drawView.drawColor = color
        }
    }
}
