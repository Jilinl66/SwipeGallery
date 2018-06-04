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
    @IBOutlet weak var logoView: LogoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoView.delegate = self
    }

    func logoTraceComplete() {
        statusLabel.text = "Trace Complete"
    }
    
}
