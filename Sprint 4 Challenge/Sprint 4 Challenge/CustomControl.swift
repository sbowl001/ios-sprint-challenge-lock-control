//
//  CustomControl.swift
//  Sprint 4 Challenge
//
//  Created by Stephanie Bowles on 6/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class CustomControl: UIControl {
    
    var isUnlocked: Bool = false
    
    var percentageComplete: Double = 0.0
    
    var ball = UIView()
    private var ballWidth: CGFloat {
        return self.frame.height * 0.8
    }
 
 
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureBall()
    }
    
    
   private func configureBall() {
    
        ball.isUserInteractionEnabled = false 
        ball.frame = CGRect(x: 5, y: 5, width: ballWidth, height: ballWidth)
        ball.backgroundColor = .black
        ball.layer.cornerRadius = ballWidth / 2
        
        self.addSubview(ball)
        print("ball frame size: \(ball.frame)")
    }
    
    
    private func calculatePercentMove(with touchPoint: CGPoint) {
        //from within the width of ballFrame slider
        
        let sliderContainerWidth = self.bounds.width
        let startPosition  = ball.frame.width + 5  //+5
        let endPosition = sliderContainerWidth - 5   //-5
        let distance = startPosition - touchPoint.x
        let percentCalculated = Double(distance / (endPosition - startPosition))
        percentageComplete = abs(percentCalculated)
        print("start position: \(startPosition)")
        print("end position: \(endPosition)")
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if ball.frame.contains(touchPoint) {
            sendActions(for: [.touchDown, .valueChanged])
        } else {
            return false
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if self.bounds.contains(touchPoint){
            calculatePercentMove(with: touchPoint)
          
            
            
            let sliderContainerWidth = self.bounds.width
            let startPosition  = ball.frame.width + 5 //+5
            let endPosition = sliderContainerWidth - 5  //-5
            let x = Double(endPosition - startPosition) * percentageComplete
            
            ball.frame = CGRect(x: CGFloat(x), y: ball.frame.origin.y, width: ballWidth, height: ballWidth) //width may need to be different
     
            sendActions(for: [.touchDragInside, .valueChanged])
 
            
        } else {
            ball.frame = CGRect(x: 5, y: 5, width: ballWidth, height: ballWidth)
            sendActions(for: [.touchDragOutside])
            
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        
        defer { super.endTracking(touch, with: event)}

        guard let touch = touch else {return}
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            calculatePercentMove(with: touchPoint)
            if percentageComplete < 0.8 {
                
                isUnlocked = false
                UIView.animate(withDuration: 1.0) {
                  self.ball.frame = CGRect(x: 5, y: 5, width: self.ballWidth, height: self.ballWidth)
                }
            } else {
                isUnlocked = true
                UIView.animate(withDuration: 1.0) {
                       self.ball.frame = CGRect(x: self.bounds.width - self.ball.frame.width - 5 , y: 5, width: self.ballWidth, height: self.ballWidth)
                    
                }
               
//                self.isUserInteractionEnabled = false
            }
            sendActions(for: [.touchUpOutside, .valueChanged])
            
        }
//            else {
//            ball.frame = CGRect (x: self.bounds.width - ball.frame.width - 5, y: 5, width: ballWidth, height: ballWidth)
//            isUnlocked = true
//            self.isUserInteractionEnabled = false
//        }
//        sendActions(for: .touchUpOutside)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        super.cancelTracking(with: event)
    }
    
    func reset() {
            isUnlocked = false
            self.isUserInteractionEnabled = true
            percentageComplete = 0
            layoutSubviews()    
        }
//    private var circleWidth: CGFloat {
//        return frame.height * 0.825
//    }
//    var minValue: CGFloat = 0
//    var maxValue: CGFloat = 1
//    var isUnlocked: Bool = false
//    private var previousLocation = CGPoint()
//    private var circleView = UIView()
//    var circleValue: CGFloat = 0.0
//
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        configureCircle(circleView)
//        updateFrames()
//    }
//
//    private func configureCircle(_ circle: UIView) {
//        //previous method
////        let circle = UIView()
////        circle.backgroundColor = .black
////       circle.translatesAutoresizingMaskIntoConstraints = false
////        self.view.addSubView(circle)
//
//        //*end previous method
//        let circleFrame = CGRect(x: 0, y: 0, width: circleWidth, height: circleWidth)
//        circle.frame = circleFrame
//        circle.backgroundColor = .black
//        circle.layer.cornerRadius = circleWidth / 2
//
//        addSubview(circle)
//        circle.isUserInteractionEnabled = false
//
//    }
//    func position(for value: CGFloat) -> CGFloat {
//        return (bounds.width - circleWidth - 10) * value
//    }
//
//    private func circleFrame(for value: CGFloat) -> CGRect {
//        let x = position(for: value) + 6
//        let y = (bounds.height - circleWidth) / 2
//        return CGRect(x: x, y: y, width: circleWidth, height: circleWidth)
//    }
//
//    private func updateFrames() {
//        circleView.frame = circleFrame(for: circleValue)
//    }
//
//    func reset() {
//        circleValue = 0
//        isUnlocked = false
//        updateFrames()
//        self.isUserInteractionEnabled = true
//    }
//
//    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        previousLocation = touch.location(in: self)
//
//        if circleView.frame.contains(previousLocation) {
//            sendActions(for: [.touchDown, .valueChanged])
//        } else {
//            return false
//        }
//        return true
//    }
//
//    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        let touchPoint = touch.location(in: self)
//
//        let locationChange = touchPoint.x - previousLocation.x
//        let valueChanged = (maxValue - minValue) * locationChange / bounds.width
//
//        previousLocation = touchPoint
//
//        circleValue = min(max((circleValue + valueChanged), minValue), maxValue)
//
//        updateFrames()
////        if bounds.contains(touchPoint) {
////            sendActions(for: [.touchDragInside, .valueChanged])
////        } else {
////            sendActions(for: .touchDragOutside)
////        }
//        return true
//    }
//
//    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
//
//        defer { super.endTracking(touch, with: event)}
//        guard let touch = touch else {return}
//        previousLocation = touch.location(in: self)
//
//        if circleValue >= 0.8 {
//            circleValue = 1
//            isUnlocked = true
//            sendActions(for: [.touchUpInside, .valueChanged])
//
//            UIView.animate(withDuration: 1.0) {
//                self.circleView.frame = self.circleFrame(for: 1.0)
//            }
//        }   else {
//            sendActions(for: [.touchUpInside, .valueChanged])
//            isUnlocked = false
//            circleValue = 0
//
//            UIView.animate(withDuration: 2.0) {
//                self.circleView.frame = self.circleFrame(for: 0.0)
//            }
//        }
//        updateFrames()
//    }
////        let touchPoint = touch.location(in: self)
////        if bounds.contains(touchPoint) {
////            sendActions(for: [.touchUpInside, .valueChanged])
////        } else {
////            sendActions(for: .touchUpOutside)
////        }
////    }
//
//    override func cancelTracking(with event: UIEvent?) {
////        sendActions(for: .touchCancel)
//        super.cancelTracking(with: event)
//    }
}
