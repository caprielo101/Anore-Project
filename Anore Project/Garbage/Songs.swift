//
//  Songs.swift
//  Anore Project
//
//  Created by Josiah Elisha on 19/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import Foundation

protocol Songs {
    var notes: [NoteView] { get set }
    var songName: String { get }
    var bpm: Float { get }
    var crochet: Float { get set }
    var noteLength: Float { get  }
    var maxFrequency: Float { get set }
    var minFrequency: Float { get set}
    var noteNumber: Int { get }

}
