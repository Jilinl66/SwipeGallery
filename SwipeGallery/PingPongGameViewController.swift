//
//  PingPongGameViewController.swift
//  SwipeGallery
//
//  Created by Jilin Liu on 6/2/18.
//  Copyright © 2018 JilinStudio, Inc. All rights reserved.
//

import UIKit

class PingPongGameViewController: UIViewController {

    @IBOutlet weak var boardView: UIView!
    
    struct Constants {
        static let paddleHeight: CGFloat = 60.0
        static let velocity: CGPoint = CGPoint(x: 10, y: 10)
    }
    
    var paddleView: PaddleView!
    var ballView: UIView!
    
    var pause = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        drawPaddle()
        drawBall()
        Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(play), userInfo: nil, repeats: true)
    }
    
    private func drawPaddle() {
        paddleView = PaddleView(frame: CGRect(x: 10, y: 10, width: 10, height: Constants.paddleHeight))
        boardView.addSubview(paddleView)
    }
    
    private func drawBall() {
        let radius: CGFloat = 20
        
        // Init ball view
        let rect = CGRect(x: boardView.bounds.width / 2 - radius / 2, y: boardView.bounds.height / 2 - radius / 2, width: radius, height: radius)
        ballView = UIView(frame: rect)
        
        // Create path for the ball
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: radius, height: radius), cornerRadius: radius)
        
        //Set path for the layout
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        // Apply other properties to layer
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 0
        shapeLayer.position = CGPoint(x: 0, y: 0)
        
        // Add shape layer to ball view
        ballView.layer.addSublayer(shapeLayer)
        
        //Add ballview to parent view
        boardView.addSubview(ballView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if pause {
            pause = false
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: boardView)
        if location.y < Constants.paddleHeight / 2 || location.y > boardView.bounds.height - Constants.paddleHeight / 2 {
            return
        }
        paddleView.center = CGPoint(x: paddleView.center.x, y: location.y)
    }
    
    @objc private func play() {
        if pause {
            return
        }
        ballView.center = CGPoint(x: ballView.center.x + Constants.velocity.x, y: ballView.center.y + Constants.velocity.y)
    }
}
