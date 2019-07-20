//
//  Int+extension.swift
//  Anore Project
//
//  Created by Josiah Elisha on 20/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import Foundation

public extension Int {
    var asWord: String {
        let numberValue = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(from: numberValue)!
    }
}
