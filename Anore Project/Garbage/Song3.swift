//
//  Song3.swift
//  Anore Project
//
//  Created by Josiah Elisha on 18/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.


//nina bobo
import Foundation

class Song3: Song {
    //song configuration
    var songName = ""
    var bpm: Float = 0 //in beat per seconds
    var crochet: Float = 0.0 //in seconds
    let noteLength: Float = 100.0 //note length in points
    var bestScore: Float = 0.0
    
    //put max and min frequency here
    var maxFrequency: Float = MusicConstants.noteFrequencies[7]*pow(2, 4)//392
    var minFrequency: Float = MusicConstants.noteFrequencies[7]*pow(2, 3)//196//24.5 * pow(2,3)
    
    var notes: [NoteView] = []
    //how much note is in the frequency range //still need manual
    let noteNumber = 13
    
    override init() {
        super.init()
//        self.songName = songName
//        self.bpm = bpm
        self.songName = "nina bobo"
        self.bpm = 60
        self.crochet = 60.0/bpm
        createCharts()
    }
    
    private func createCharts() {
        // mi fa
        
        
        // sol do sol mi
        
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
//notes.append(NoteView(note: Note(octave: 3, frequency: freq(index: 0, octave: 3), pitch: "C", distance: noteLength, isHit: false), duration: crochet*0.5))
