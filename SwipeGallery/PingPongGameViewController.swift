//
//  PingPongGameViewController.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/2/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class PingPongGameViewController: UIViewController {

    var paddleView: PaddleView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        paddleView = PaddleView(frame: CGRect(x: 10, y: 10, width: 10, height: 60))
        paddleView.backgroundColor = UIColor.yellow
        view.addSubview(paddleView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
