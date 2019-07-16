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
    var tempProgress: Float = 0
    var timer: Timer!
    
    init(note: Note, duration: Float) {
        super.init(frame: CGRect.zero)
        
        self.note = note
        self.duration = duration
        
        backgroundColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        
        backgroundColor = .black
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration/1000), target: self, selector: #selector(stopTimer), userInfo: nil, repeats: true)
    }
    
    @objc func stopTimer() {
        if let timer = timer {
            if timer.timeInterval == Double(duration/1000) {
                timer.invalidate()
            }
        }
    }
}
