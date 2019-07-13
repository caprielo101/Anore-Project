//
//  Note.swift
//  Anore Project
//
//  Created by Josiah Elisha on 09/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import Foundation

struct Note {
    var octave: Int = 0
    var frequency: Float = 0
    var pitch: String = ""
    var distance: Float = 0 //or duration/length
    var isHit: Bool = false
}
