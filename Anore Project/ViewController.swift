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
    @IBOutlet weak var indicate: UIView!
    @IBOutlet weak var ProgressView: NoteView!
    @IBOutlet weak var ProgressView2: NoteView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var amplitudeLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    
    @IBOutlet weak var noteNameWithFlatsLabel: UILabel!
    @IBOutlet weak var noteNameWithSharpsLabel: UILabel!
    
    //need to make note array (note view array) variables
    var notes: [NoteView] = []
    
    var isHittingNote = false
    
    var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    var timer: Timer!
    
    let noteFrequencies = [16.35, 17.32, 18.35, 19.45, 20.6, 21.83, 23.12, 24.5, 25.96, 27.5, 29.14, 30.87]
    let noteNamesWithSharps = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
    let noteNamesWithFlats = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]
    
    let bpm: Float = 120
    var crochet: Float = 0
    
    var noteLength: Float = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        crochet = 60.0/bpm
        
        configure()
        configureUI()
        
        let note1 = NoteView(note: Note(octave: 1, frequency: 200, pitch: "", distance: 0, isHit: false), duration: crochet)
        view.addSubview(note1)
        NSLayoutConstraint.activate([
            note1.widthAnchor.constraint(equalToConstant: CGFloat(note1.duration*noteLength*2)),
            note1.heightAnchor.constraint(equalToConstant: 10),
            note1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            note1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            ])
        note1.translatesAutoresizingMaskIntoConstraints = false
        
        ProgressView.note = Note(octave: 0, frequency: 0, pitch: "", distance: 0, isHit: false)
        ProgressView2.note = Note(octave: 0, frequency: 0, pitch: "", distance: 0, isHit: false)
        ProgressView.duration = crochet
        ProgressView2.duration = crochet/2
        
        ProgressView.widthAnchor.constraint(equalToConstant: CGFloat(ProgressView.duration * noteLength)).isActive = true
        ProgressView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        ProgressView.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(ProgressView.frame.width/2)).isActive = true
        ProgressView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 300).isActive = true
        
        ProgressView2.widthAnchor.constraint(equalToConstant: CGFloat(ProgressView2.duration * noteLength)).isActive = true
        ProgressView2.heightAnchor.constraint(equalToConstant: 10).isActive = true
        ProgressView2.leadingAnchor.constraint(equalTo: ProgressView.trailingAnchor, constant: -(ProgressView.frame.width/2)).isActive = true
        ProgressView2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 400).isActive = true
        
        
//        ProgressView.translatesAutoresizingMaskIntoConstraints = false
//        ProgressView2.translatesAutoresizingMaskIntoConstraints = false
        notes.append(note1)
        notes.append(ProgressView)
        notes.append(ProgressView2)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
        
        //1 pt/duration for 1 sec
        _ = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (Timer) in
            UIView.animate(withDuration: 0.01, animations: {
                for note in self.notes {
                    note.center.x -= 1
                }
//                if let pview = self.ProgressView {
//                    pview.center.x -= 1
//                    if pview.center.x < 0 {
//                        self.ProgressView.removeFromSuperview()
//                    }
//                }
//                if let pview2 = self.ProgressView2 {
//                    pview2.center.x -= 1
//                    if pview2.center.x < 0 {
//                        self.ProgressView2.removeFromSuperview()
//                    }
//                }
            })
        })
        
        _ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(checkForNotes), userInfo: nil, repeats: true)
    }
    
    
    //randomising notes
    func randomizeNotes() {
        
    }
    
    func configure() {
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 1)
        AKSettings.audioInputEnabled = true
    }
    
    //configure UI
    func configureUI() {
        indicate.layer.cornerRadius = indicate.frame.height/2
//        indicate.layer.borderColor = UIColor.red.cgColor
//        indicate.layer.borderWidth = 1
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
            //            _ = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (Timer) in
            //                self.indicate.center.y = self.view.frame.height - (CGFloat(self.tracker.frequency/2000))*self.view.frame.height
            //            })
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.indicate.center.y = self.view.frame.height - (CGFloat(self.tracker.frequency/1000))*self.view.frame.height
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.indicate.center.y = self.view.frame.height - (self.indicate.frame.height/2)
            }, completion: nil)
        }
        amplitudeLabel.text = String(format: "%0.2f", tracker.amplitude)
        //        checkForNotes()
        
    }
    
    @objc func checkForNotes() -> Bool {
        
        for note in notes {
            if note.frame.intersects(indicate.frame) {
//                print("intersect")
                note.note.isHit = true
                print(note.note.isHit)
                return true
                
            }
        }
        return false
        
    }
    
}

