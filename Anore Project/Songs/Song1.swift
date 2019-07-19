//
//  Song1.swift
//  Anore Project
//
//  Created by Gilang Sinawang on 18/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import Foundation

//Twinkle-twinkle song
class Song1: Song {
    //song configuration
    private var songName = ""
    var bpm: Float = 0 //in beat per seconds
    var crochet: Float = 0.0 //in seconds
    let noteLength: Float = 100.0 //note length in points
    var bestScore: Float = 0.0
    
    //put max and min frequency here
    var maxFrequency: Float = MusicConstants.noteFrequencies[0] * pow(2, 4) //c4
    var minFrequency: Float = MusicConstants.noteFrequencies[0] * pow(2, 3) //c3
    
    var notes: [NoteView] = []
    //how much note is in the frequency range //still need manual
    let noteNumber = 13
    
    override init() {
        super.init()
        self.songName = "twinle-twinkle little star"
        self.bpm = 60.0
        self.crochet = 60.0/bpm
        createCharts()
    }
    
    //crochet 1 ketuk
    //minim 2 ketuk
    //whole 4 ketuk
    //quave 1/2 ketuk
    //semjiquaver 1/4 ketuk
    
    private func createCharts() {
        // do do sol sol
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        // la la sollllll
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 3), pitch: "A", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 3), pitch: "A", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: noteLength/2, isHit: false), duration: crochet/2))
        // fa fa mi mi re re dooo
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 6, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 6, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: noteLength/2, isHit: false), duration: crochet/2))
        // sol sol fa fa mi mi re
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 6, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 6, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: noteLength/2, isHit: false), duration: crochet/2))
        // sol sol fa fa mi mi re
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 6, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 6, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: noteLength/2, isHit: false), duration: crochet/2))
        // do do sol sol
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        // la la sollllll
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 3), pitch: "A", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 3), pitch: "A", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: noteLength/2, isHit: false), duration: crochet/2))
        // fa fa mi mi re re do
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 6, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 6, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: noteLength/2, isHit: false), duration: crochet/2))
}
}
