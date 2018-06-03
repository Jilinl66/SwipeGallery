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
    
    @IBOutlet weak var robotScoreLabel: UILabel!
    @IBOutlet weak var myScoreLabel: UILabel!
    
    var paddleLeft: PaddleView!
    var paddleRight: PaddleView!
    var ballView: UIView!
    
    struct Constants {
        static let margin: CGFloat = 10.0
    }
    
    let paddleWidth: CGFloat = 10.0
    let paddleHeight: CGFloat = 60.0
    var velocity = CGPoint(x: 10, y: 10)
    var topBottomThreshold: CGFloat {
        return abs(velocity.y)
    }
    
    var scoreLeft: Int = 0 {
        didSet {
            robotScoreLabel.text = "Robot Score: \(scoreLeft)"
        }
    }
    var scoreRight: Int = 0 {
        didSet {
            myScoreLabel.text = "My Score: \(scoreRight)"
        }
    }
    
    var pause = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if ballView != nil {
            return
        }
        drawPaddle()
        drawBall()
        Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(play), userInfo: nil, repeats: true)
    }
    
    private func drawPaddle() {
        paddleLeft = PaddleView(frame: CGRect(x: Constants.margin, y: boardView.bounds.height / 2 - paddleHeight / 2, width: paddleWidth, height: paddleHeight))
        boardView.addSubview(paddleLeft)
        paddleRight = PaddleView(frame: CGRect(x: boardView.bounds.width - paddleWidth - Constants.margin, y: boardView.bounds.height / 2 - paddleHeight / 2, width: paddleWidth, height: paddleHeight))
        boardView.addSubview(paddleRight)
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
        if location.y < paddleHeight / 2 || location.y > boardView.bounds.height - paddleHeight / 2 {
            return
        }
        paddleRight.center = CGPoint(x: paddleRight.center.x, y: location.y)
    }
    
    @objc private func play() {
        if pause {
            return
        }
        ballView.center = CGPoint(x: ballView.center.x + velocity.x, y: ballView.center.y + velocity.y)
        
        detectGoal()
        
        //Bounce off of top and bottom walls
        if ballView.frame.minY < topBottomThreshold || ballView.frame.maxY > boardView.bounds.maxY - topBottomThreshold {
            velocity.y = -velocity.y
        }
        
        // Bounce off of left paddle
        if ballView.frame.maxY > paddleLeft.frame.minY && ballView.frame.minY < paddleLeft.frame.maxY && ballView.frame.minX < paddleLeft.frame.maxX {
            velocity.x = -velocity.x
        }
        
        // Bounce off of right paddle
        if ballView.frame.maxY > paddleRight.frame.minY && ballView.frame.minY < paddleRight.frame.maxY && ballView.frame.maxX > paddleRight.frame.minX {
            velocity.x = -velocity.x
        }
        
        // Move robot
        if velocity.x < 0 {
            let newCenterY = paddleLeft.center.y + velocity.y
            if newCenterY >= paddleHeight / 2 && newCenterY <= boardView.bounds.height - paddleHeight / 2 {
                paddleLeft.center = CGPoint(x: paddleLeft.center.x, y: newCenterY)
            }
        }
    }
    
    private func detectGoal() {
        if ballView.frame.minX < 0 {
            scoreRight += 1
            kickOff()
        } else if ballView.frame.maxX > boardView.bounds.width {
            scoreLeft += 1
            kickOff()
        }
    }
    
    private func kickOff() {
        pause = true
        ballView.center = CGPoint(x: boardView.bounds.midX, y: boardView.bounds.midY)
        paddleLeft.center = CGPoint(x: paddleLeft.center.x, y: boardView.bounds.midY)
        paddleRight.center = CGPoint(x: paddleRight.center.x, y: boardView.bounds.midY)
    }
}
