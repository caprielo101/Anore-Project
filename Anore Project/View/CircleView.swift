//
//  CircleView.swift
//  Anore Project
//
//  Created by Josiah Elisha on 21/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

@IBDesignable class CircleView: UIView {
    
    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 20
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 5
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    var counterColor: UIColor = UIColor.green
    
    var startAngle: CGFloat = 0
    var endAngle: CGFloat = 0
    var diameter: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        UIColor.clear.setFill()
        // 1
        let centerA = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        // 2
        diameter = max(bounds.width, bounds.height)
        
//        // 3
//        startAngle = 0
//        endAngle = 0
        // 4
        let path = UIBezierPath(arcCenter: centerA,
                                radius: diameter/2 - Constants.arcWidth/2,
                                startAngle: startAngle - 0.5 * .pi,
                                endAngle: endAngle - 0.5 * .pi,
                                clockwise: true)
        
        // 5
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
    }
    
    
}
