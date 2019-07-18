//
//  UIColor+extension.swift
//  Anore Project
//
//  Created by Josiah Elisha on 17/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    static let color1 = UIColor(r: 253, g: 157, b: 157)
    static let color2 = UIColor(r: 255, g: 171, b: 171)
    static let color3 = UIColor(r: 253, g: 182, b: 167)
    static let color4 = UIColor(r: 253, g: 222, b: 193)
    static let color5 = UIColor(r: 255, g: 245, b: 186)
    static let color6 = UIColor(r: 208, g: 249, b: 202)
    static let color7 = UIColor(r: 219, g: 255, b: 214)
    static let color8 = UIColor(r: 172, g: 229, b: 253)
    static let color9 = UIColor(r: 201, g: 237, b: 251)
    static let color10 = UIColor(r: 217, g: 217, b: 239)
    static let color11 = UIColor(r: 195, g: 198, b: 238)
    static let color12 = UIColor(r: 186, g: 197, b: 252)
    static let textColor = UIColor(r: 142, g: 142, b: 147)
    static let backgroundColor = UIColor(r: 255, g: 254, b: 212)
    
}
