//
//  AllSongs.swift
//  Anore Project
//
//  Created by Josiah Elisha on 19/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import Foundation

class AllSongs {
    let bpm: Float
    let noteLength: Float
    
    var songName: String
    var crochet: Float
    var maxFreq: Float
    var minFreq: Float
    
    var notes: [NoteView]
    var noteNumber: Int
    
    init(name: String, maxFreq: Float, minFreq: Float, noteNumber: Int) {
        self.songName = name
        self.maxFreq = maxFreq
        self.minFreq = minFreq
        self.noteNumber = noteNumber
        self.notes = []
        self.bpm = 60.0
        self.noteLength = 100.0
        self.crochet = 60/self.bpm
    }
    
    func freq(index: Int, octave: Float) -> Float {
        return MusicConstants.noteFrequencies[index] * pow(2, octave)
    }
}
