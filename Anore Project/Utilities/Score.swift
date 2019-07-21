//
//  Score.swift
//  Anore Project
//
//  Created by Josiah Elisha on 21/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit
import Foundation

var saveScore = SaveScore()

struct Score {
    static var warmup1: CGFloat = 0.0
    static var warmup2: CGFloat = 0.0
    static var warmup3: CGFloat = 0.0
    static var song1: CGFloat = 0.0
    static var song2: CGFloat = 0.0
    static var song3: CGFloat = 0.0
    static var song4: CGFloat = 0.0
}

class SaveScore {
    var hitNote: Int = 0
    var totalNotes: Int = 0
    var hitC: Int = 0
    var hitCS: Int = 0
    var hitD: Int = 0
    var hitDS: Int = 0
    var hitE: Int = 0
    var hitF: Int = 0
    var hitFS: Int = 0
    var hitG: Int = 0
    var hitGS: Int = 0
    var hitA: Int = 0
    var hitAS: Int = 0
    var hitB: Int = 0
    var totalC: Int = 0
    var totalCS: Int = 0
    var totalD: Int = 0
    var totalDS: Int = 0
    var totalE: Int = 0
    var totalF: Int = 0
    var totalFS: Int = 0
    var totalG: Int = 0
    var totalGS: Int = 0
    var totalA: Int = 0
    var totalAS: Int = 0
    var totalB: Int = 0
}

/*
 
 switch note.note.pitch {
 case "C":
 saveScore.totalC += 1
 case "CS":
 saveScore.totalCS += 1
 case "D":
 saveScore.totalD += 1
 case "DS":
 saveScore.totalDS += 1
 case "E":
 saveScore.totalE += 1
 case "F":
 saveScore.totalF += 1
 case "FS":
 saveScore.totalFS += 1
 case "G":
 saveScore.totalG += 1
 case "GS":
 saveScore.totalGS += 1
 case "A":
 saveScore.totalA += 1
 case "AS":
 saveScore.totalAS += 1
 case "B":
 saveScore.totalB += 1
 default:
 print("Hello")
 }
 */
