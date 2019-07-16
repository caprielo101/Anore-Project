//
//  LineView.swift
//  Anore Project
//
//  Created by Josiah Elisha on 16/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class LineView: UIView {
    
    var startPoint: CGPoint? { didSet { setNeedsDisplay() } }
    var endPoint: CGPoint?   { didSet { setNeedsDisplay() } }
    
    override func draw(_ rect: CGRect) {
        guard let startPoint = startPoint, let endPoint = endPoint else { return }
        
        let linePath = UIBezierPath()
        linePath.move(to: startPoint)
        linePath.addLine(to: endPoint)
        linePath.lineWidth = 2
        
        UIColor.black.setStroke()
        linePath.stroke()
    }
}

