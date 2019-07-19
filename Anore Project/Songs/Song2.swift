//
//  Song2.swift
//  Anore Project
//
//  Created by Rico Kristanto on 19/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import Foundation

// Balonku

class Song2: Song {
    //song configuration
    var songName = ""
    var bpm: Float = 0 //in beat per seconds
    var crochet: Float = 0.0 //in seconds
    let noteLength: Float = 100.0 //note length in points
    var bestScore: Float = 0.0
    
    //put max and min frequency here
    var maxFrequency: Float = 0
    var minFrequency: Float = 0
    
    var notes: [NoteView] = []
    //how much note is in the frequency range //still need manual
    let noteNumber = 29
    
    override init() {
        super.init()
        //        self.songName = songName
        //        self.bpm = bpm
        self.songName = "Balonku"
        self.bpm = 60
        self.crochet = 60.0/bpm
        createCharts()
    }
    
    private func createCharts() {
        // 2
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        // 3
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet))
        // 4
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: noteLength/2, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        // 5
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet))
        // 6
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: noteLength/2, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        // 7
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 3), pitch: "A", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 3), pitch: "A", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 10, octave: 3), pitch: "B", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet))
        // 8
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: noteLength/2, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        // 9
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet))
        // 10
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: noteLength/2, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        // 11
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet))
        // 12
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 4), pitch: "C", distance: noteLength, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        // 13
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet))
        // 14
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: noteLength/2, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        // 15
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 3), pitch: "A", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 3), pitch: "A", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 10, octave: 3), pitch: "B", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet))
        // 16
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: noteLength/2, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        // 17
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet))
        // 18
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: noteLength/2, isHit: false), duration: crochet*2))
    }
    
}
