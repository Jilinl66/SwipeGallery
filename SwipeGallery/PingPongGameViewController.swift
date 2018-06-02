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
        view.addSubview(paddleView)
        
        view.backgroundColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var shouldAutorotate: Bool {
        return preferredInterfaceOrientationForPresentation == .landscapeRight
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        paddleView.center = CGPoint(x: paddleView.center.x, y: location.y)
    }
}
