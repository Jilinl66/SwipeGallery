//
//  TaceInteractivePageViewController.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/3/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class TaceInteractivePageViewController: UIViewController, LogoTraceDelegate {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var logoViewPath1: LogoView!
    @IBOutlet weak var logoViewPath2: LogoView!
    @IBOutlet weak var logoViewPath3: LogoView!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoViewPath1.delegate = self
        logoViewPath2.delegate = self
        logoViewPath3.delegate = self
    }

    func logoTraceComplete() {
        count += 1
        if count == 3 {
            DispatchQueue.main.async {
                self.statusLabel.text = "Trace Complete"
            }
        }
    }
}
