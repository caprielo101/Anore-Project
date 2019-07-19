//
//  SongTwo.swift
//  Anore Project
//
//  Created by Josiah Elisha on 19/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

//Nina bobo
class SongTwo: AllSongs {

    var bestScore: Float = 0.0
    
    override init(name: String, maxFreq: Float, minFreq: Float, noteNumber: Int) {
        super.init(name: name, maxFreq: maxFreq, minFreq: minFreq, noteNumber: noteNumber)
        createCharts()
    }
    
    func createCharts() {
        //
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet))
        //
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 7, octave: 4), pitch: "G", distance: 0, isHit: false), duration: crochet*0.5))
        //
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 2, octave: 4), pitch: "D", distance: noteLength/2, isHit: false), duration: crochet*1.5))
        //
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 3), pitch: "G", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 11, octave: 3), pitch: "B", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index:0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet*0.5))
        
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet*0.5))
        
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet*0.5))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 1, isHit: false), duration: crochet))
    }
}
