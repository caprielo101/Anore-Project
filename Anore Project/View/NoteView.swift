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
    
    init(note: Note, duration: Float) {
        super.init(frame: CGRect.zero)
        
        self.note = note
        self.duration = duration
        
        createCenterLabel(note)
        
        backgroundColor = giveColor()
    }

    fileprivate func createCenterLabel(_ note: Note) {
        let label = UILabel()
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = note.pitch
        label.textColor = .textColor //warnanya jelek
//        label.font = UIFont(name: "Young", size: 24)
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
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
        case "C♯","D♭":
            return UIColor.color2
        case "D":
            return UIColor.color3
        case "D♯","E♭":
            return UIColor.color4
        case "E":
            return UIColor.color5
        case "F":
            return UIColor.color6
        case "F♯","G♭":
            return UIColor.color7
        case "G":
            return UIColor.color8
        case "G♯","A♭":
            return UIColor.color9
        case "A":
            return UIColor.color10
        case "A♯","B♭":
            return UIColor.color11
        case "B":
            return UIColor.color12
        default:
            return UIColor.clear
        }
    }
}
