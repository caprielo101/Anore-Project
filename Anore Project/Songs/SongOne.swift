//
//  SongOne.swift
//  Anore Project
//
//  Created by Josiah Elisha on 19/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

//Twinkle twinkle Song
class SongOne: AllSongs {
    
    var bestScore: Float = 0.0

    override init(name: String, maxFreq: Float, minFreq: Float, noteNumber: Int) {
        super.init(name: name, maxFreq: maxFreq, minFreq: minFreq, noteNumber: noteNumber)
        createCharts()
    }
    
    
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
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: noteLength/2, isHit: false), duration: crochet/2))
        // sol sol fa fa mi mi re
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: noteLength/2, isHit: false), duration: crochet/2))
        // sol sol fa fa mi mi re
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
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
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: noteLength/2, isHit: false), duration: crochet/2))
    }
}
