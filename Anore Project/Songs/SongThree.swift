//
//  SongThree.swift
//  Anore Project
//
//  Created by Josiah Elisha on 19/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

//Balonku
class SongThree: AllSongs {
    
//    var bestScore: Float = 0.0
    
    override init(name: String, maxFreq: Float, minFreq: Float, noteNumber: Int) {
        super.init(name: name, maxFreq: maxFreq, minFreq: minFreq, noteNumber: noteNumber)
        createCharts()
    }
    
    func createCharts() {
        // 2 ba lon
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        // 3 ku a da li
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 5), pitch: "C", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet))
        // 4 ma . . ru pa
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: noteLength, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        // 5 ru pa war na
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet))
        // 6 nya . . me rah
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: noteLength, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        // 7 ku ning ke la
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 4), pitch: "A", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 4), pitch: "A", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 11, octave: 4), pitch: "B", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 5), pitch: "C", distance: 0, isHit: false), duration: crochet))
        // 8 bu . . me ra
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: noteLength, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        // 9 mu da dan bi
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet))
        // 10 ru . . me le
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 4), pitch: "C", distance: noteLength, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        // 11 tus ba lon hi
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 5), pitch: "C", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet))
        // 12 jau dor . ha ti
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 5), pitch: "C", distance: noteLength, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        // 13 ku sa ngat ka
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet))
        // 14 cau . . ba lon
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: noteLength, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 4), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        // 15 ku ting gal em
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 4), pitch: "A", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 9, octave: 4), pitch: "A", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 11, octave: 4), pitch: "B", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 4, frequency: freq(index: 0, octave: 5), pitch: "C", distance: 0, isHit: false), duration: crochet))
        // 16 pat . . ku pe
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: noteLength, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        // 17 gang e rat e
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 7, octave: 4), pitch: "G", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 5, octave: 4), pitch: "F", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 4, octave: 4), pitch: "E", distance: 0, isHit: false), duration: crochet))
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 2, octave: 4), pitch: "D", distance: 0, isHit: false), duration: crochet))
        // 18 rat . .
        notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 4), pitch: "C", distance: noteLength, isHit: false), duration: crochet*2))
    }
}

