//
//  ViewController.swift
//  Anore Project
//
//  Created by Josiah Elisha on 09/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {
    
    //debugging labels
    @IBOutlet weak var amplitudeLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var noteNameWithFlatsLabel: UILabel!
    @IBOutlet weak var noteNameWithSharpsLabel: UILabel!
    
    //base view for gameplay (container view)
    @IBOutlet weak var BaseView: UIView!
    //need to make note array (note view array) variables
    var notes: [NoteView] = []
    
    //small circle for indicator (biji bulat kecil)
    private let indicate =  UIView()
    
    var isHittingNote = false
    
    //AudioKit
    var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    
    //timer blm dipakai
    var timer: Timer!
    
    //note frequencies
    let noteFrequencies = [16.35, 17.32, 18.35, 19.45, 20.6, 21.83, 23.12, 24.5, 25.96, 27.5, 29.14, 30.87]
    let noteNamesWithSharps = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
    let noteNamesWithFlats = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]
    
    //song configuration
    let bpm: Float = 60.0 //in beat per seconds
    var crochet: Float = 0.0 //in seconds
    var noteLength: Float = 100.0 //note length in points
    var maxFrequency: Float = 493.889050 //b4
    var minFrequency: Float = 98.0 //g2
//    
//    var maxFrequency: Float = 493.889050*2
//    var minFrequency: Float = 98.0*2
    
    let noteNumber = 29

    //base view dimension
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        crochet = 60.0/bpm //in seconds
        
        width = BaseView.frame.width
        height = BaseView.frame.height
        
        configure()
        configureNotes()
        configureUI()
        drawHorizontalLines()
        drawVerticalLines()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        RoundingNotes()
        
        do {
            try AudioKit.stop()
            AudioKit.output = silence
            try AudioKit.start()
        } catch {
            AKLog("error")
        }
        
        _ = Timer.scheduledTimer(timeInterval: 0.01,
                                 target: self,
                                 selector: #selector(updateUI),
                                 userInfo: nil,
                                 repeats: true)
    }
    
    
    fileprivate func RoundingNotes() {
        for note in notes {
            note.layer.cornerRadius = note.frame.height/6
            note.clipsToBounds = true
            note.layer.masksToBounds = true
        }
    }
    
    fileprivate func configureNotes() {
        notes.append(NoteView(note: Note(octave: 3, frequency: 220, pitch: "A", distance: noteLength, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 4, frequency: 440, pitch: "A", distance: noteLength*crochet, isHit: false), duration: crochet*2))
        notes.append(NoteView(note: Note(octave: 3, frequency: 16.35*pow(2, 3), pitch: "C", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: 18.35*pow(2, 3), pitch: "D", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: 20.6*pow(2, 3), pitch: "E", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: 21.83*pow(2, 3), pitch: "F", distance: 0, isHit: false), duration: crochet/2))
        notes.append(NoteView(note: Note(octave: 3, frequency: 24.5*pow(2, 3), pitch: "G", distance: 0, isHit: false), duration: crochet))
        
        for (index, note) in notes.enumerated() {
            
            view.addSubview(note)
            
            let previousLeading = index == 0 ? view.trailingAnchor : notes[index-1].trailingAnchor
            let previousDistance = index == 0 ? 0 : notes[index-1].note.distance
            
            note.widthAnchor.constraint(equalToConstant: CGFloat(note.duration*noteLength)).isActive = true
            note.heightAnchor.constraint(equalToConstant: self.height/CGFloat((noteNumber-1))).isActive = true
            note.leadingAnchor.constraint(equalTo: previousLeading, constant: CGFloat(previousDistance)).isActive = true
            note.centerYAnchor.constraint(equalTo: BaseView.bottomAnchor, constant: -(CGFloat(getCentsInterval(voiceFrequency: Double(note.note?.frequency ?? 0), minFrequency, maxFrequency))*height)).isActive = true
            note.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    fileprivate func drawHorizontalLines() {
        let xVal: CGFloat = 0.0
        let yVall = height/CGFloat(noteNumber-1)
        
        for i in 0..<noteNumber {
            let lineView = LineView()
            lineView.alpha = 0.3
            lineView.backgroundColor = .black
            lineView.startPoint = CGPoint(x: xVal, y: yVall)
            lineView.endPoint = CGPoint(x: BaseView.frame.width, y: yVall)
            lineView.translatesAutoresizingMaskIntoConstraints = false
            BaseView.addSubview(lineView)
            
            NSLayoutConstraint.activate([
                lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                lineView.topAnchor.constraint(equalTo: BaseView.topAnchor, constant: CGFloat(i)*yVall),
//                lineView.bottomAnchor.constraint(equalTo: BaseView.bottomAnchor, constant: -(yVall)),
                lineView.heightAnchor.constraint(equalToConstant: 1)
                ])
            //            yVal += CGFloat(BaseView.frame.height/noteNumber)
//            yVall += BaseView.frame.height/CGFloat(noteNumber-1)
        }
    }
    
    fileprivate func drawVerticalLines() {
        let verticalLine = LineView()
        verticalLine.alpha = 1
        verticalLine.backgroundColor = .black
        verticalLine.startPoint = CGPoint(x: indicate.center.x, y: BaseView.frame.origin.y)
        verticalLine.endPoint = CGPoint(x: indicate.center.x, y: BaseView.frame.origin.y + BaseView.frame.height)
        verticalLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalLine)
        
        NSLayoutConstraint.activate([
            verticalLine.topAnchor.constraint(equalTo: BaseView.topAnchor, constant: -25),
            verticalLine.bottomAnchor.constraint(equalTo: BaseView.bottomAnchor, constant: 25),
            verticalLine.widthAnchor.constraint(equalToConstant: 1),
            verticalLine.leadingAnchor.constraint(equalTo: BaseView.leadingAnchor, constant: width/4)
            ])
    }
    
    //configure AudioKit
    func configure() {
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 1)
        AKSettings.audioInputEnabled = true
    }
    
    //configure UI
    func configureUI() {
        indicate.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        indicate.center = CGPoint(x: width/4, y: 0)
        indicate.layer.cornerRadius = indicate.frame.height/2
        indicate.backgroundColor = .black
        view.addSubview(indicate)
    }
    
    @objc func updateUI() {
        if tracker.amplitude > 0.1 {
            frequencyLabel.text = String(format: "%0.1f", tracker.frequency)
            
            var frequency = Float(tracker.frequency)
            while (frequency > Float(noteFrequencies[noteFrequencies.count-1])) {
                frequency = frequency / 2.0
            }
            while (frequency < Float(noteFrequencies[0])) {
                frequency = frequency * 2.0
            }
            
            var minDistance: Float = 10000.0
            var index = 0
            
            for i in 0..<noteFrequencies.count {
                let distance = fabsf(Float(noteFrequencies[i]) - frequency)
                if (distance < minDistance){
                    index = i
                    minDistance = distance
                }
            }
            let octave = Int(log2f(Float(tracker.frequency) / frequency))
            noteNameWithSharpsLabel.text = "\(noteNamesWithSharps[index])\(octave)"
            noteNameWithFlatsLabel.text = "\(noteNamesWithFlats[index])\(octave)"
//            print("\(noteNameWithSharpsLabel.text!) f=\(tracker.frequency) A=\(tracker.amplitude)")
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.indicate.center.y = self.height + self.BaseView.frame.origin.y - self.getCentsInterval(voiceFrequency: self.tracker.frequency, self.minFrequency, self.maxFrequency) * self.height
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.indicate.center.y = self.BaseView.frame.origin.y + self.height //-  (self.indicate.frame.height/2)
            }, completion: nil)
        }
//        amplitudeLabel.text = String(format: "%0.2f", tracker.amplitude)
        checkForNotes()
    }
    
    func getCentsInterval(voiceFrequency: Double, _ minFrequency: Float, _ maxFrequency: Float) -> CGFloat {
        let f1 = CGFloat(log2(voiceFrequency/minFrequency) * 1200)
        let f2 = CGFloat(log2(maxFrequency/minFrequency) * 1200)
        let cent = f1/f2
        return cent
    }
    
    func checkForNotes()  {
        UIView.animate(withDuration: 0.01, animations: {
            for note in self.notes {
                note.center.x -= 1
            }
        })
        for note in notes {
            if note.frame.intersects(indicate.frame) {
                note.note.isHit = true
                print(note.note.isHit)
            }
        }
    }
    
}

