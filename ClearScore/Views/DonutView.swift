//
//  DonutView.swift
//  ClearScore
//
//  Created by Dikshit, Richa.
//  Copyright © 2018 Dikshit, Richa. All rights reserved.
//

import UIKit
import QuartzCore

private let distanceBetweenCircles: CGFloat = 7.0
private let circleLineWidth: CGFloat = 3.0

class DonutView: UIView {
    let startAngle = CGFloat(-1 * Double.pi/2)
    let endAngle = CGFloat(Double.pi + Double.pi/2)
    let creditScore: CGFloat
    let maxCreditScore: CGFloat
    var outerCircleLayer = CAShapeLayer()
    var innerCircleLayer = CAShapeLayer()
    var arcCenter: CGPoint!
    let scoreColor: UIColor

    var creditScorePercentage:CGFloat {
        get {
            return creditScore/maxCreditScore
        }
    }

    
    init(creditScore: CGFloat, maxCreditScore: CGFloat, frame: CGRect, scoreColor: UIColor) {
        self.creditScore = creditScore
        self.maxCreditScore = maxCreditScore
        self.scoreColor = scoreColor
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.arcCenter = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)

    }
    
    override func draw(_ rect: CGRect) {
        setUpOuterCircle()
        setupInnerArc()
        setupAnimations()
    }
    
    func setUpOuterCircle() {
        outerCircleLayer.strokeColor = UIColor.lightGray.cgColor
        outerCircleLayer.fillColor = UIColor.clear.cgColor
        outerCircleLayer.lineWidth = circleLineWidth
        outerCircleLayer.path = UIBezierPath(arcCenter: arcCenter, radius: bounds.size.width / 2 - circleLineWidth, startAngle: startAngle, endAngle: endAngle,  clockwise: true).cgPath
        layer.addSublayer(outerCircleLayer)
    }
    
    func setupInnerArc() {
       
        let path = UIBezierPath(arcCenter: arcCenter, radius: (bounds.size.width / 2) - distanceBetweenCircles - circleLineWidth, startAngle: startAngle, endAngle: endAngle, clockwise: true).cgPath
        innerCircleLayer = CAShapeLayer()
        innerCircleLayer.frame = bounds
        innerCircleLayer.fillColor = UIColor.clear.cgColor
        innerCircleLayer.strokeColor = scoreColor.cgColor
        innerCircleLayer.lineCap = kCALineCapSquare
        innerCircleLayer.lineWidth = circleLineWidth
        innerCircleLayer.strokeEnd = 0
        innerCircleLayer.path = path
        layer.addSublayer(innerCircleLayer)
        
        
        // Adding gradient to the circle layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = innerCircleLayer.frame
        gradientLayer.colors = [scoreColor.withAlphaComponent(1.0).cgColor, scoreColor.withAlphaComponent(0.4).cgColor]
        gradientLayer.locations = nil
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.mask = innerCircleLayer
        layer.addSublayer(gradientLayer)
        
    }
    
    func setupAnimations() {
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = creditScorePercentage
        strokeEndAnimation.duration = 2.0
        innerCircleLayer.strokeEnd = creditScorePercentage
        strokeEndAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        innerCircleLayer.add(strokeEndAnimation, forKey: nil)
        
      
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

}
