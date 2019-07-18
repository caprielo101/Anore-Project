//
//  NoteView.swift
//  Anore Project
//
//  Created by Josiah Elisha on 09/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class NoteView: UIView {
    var note: Note!
    var duration: Float = 0  //miliseconds
//    var tempProgress: Float = 0
//    var timer: Timer!
    
    init(note: Note, duration: Float) {
        super.init(frame: CGRect.zero)
        
        self.note = note
        self.duration = duration

        backgroundColor = giveColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        
        backgroundColor = .black
    }

    func giveColor() -> UIColor {
        switch note.pitch {
        case "C":
            return UIColor.color1
        case "CS":
            return UIColor.color2
        case "D":
            return UIColor.color3
        case "DS":
            return UIColor.color4
        case "E":
            return UIColor.color5
        case "F":
            return UIColor.color6
        case "FS":
            return UIColor.color7
        case "G":
            return UIColor.color8
        case "GS":
            return UIColor.color9
        case "A":
            return UIColor.color10
        case "AS":
            return UIColor.color11
        case "B":
            return UIColor.color12
        default:
            return UIColor.clear
        }
    }
//    func startTimer() {
//        timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration/1000), target: self, selector: #selector(stopTimer), userInfo: nil, repeats: true)
//    }
//
//    @objc func stopTimer() {
//        if let timer = timer {
//            if timer.timeInterval == Double(duration/1000) {
//                timer.invalidate()
//            }
//        }
//    }
}
