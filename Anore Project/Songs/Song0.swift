//
//  Song0.swift
//  Anore Project
//
//  Created by Josiah Elisha on 18/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import Foundation

class Song0: Song {
    //song configuration
    private var songName = ""
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
    
    init(songName: String, bpm: Float) {
        super.init()
        self.songName = songName
        self.bpm = bpm
        self.crochet = 60.0/bpm
        createCharts()
    }
    
    private func createCharts() {
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 1, octave: 3), pitch: "CS", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 3, octave: 3), pitch: "DS", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 6, octave: 3), pitch: "FS", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 8, octave: 3), pitch: "GS", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 3), pitch: "A", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 10, octave: 3), pitch: "AS", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 11, octave: 3), pitch: "B", distance: 0, isHit: false), duration: crochet))
    }

}
