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
    //    private let indicate =  UIView()
    private let indicate = UIImageView()
    private let verticalLine = LineView()
    
    //boolean value for checking if note is hit
    var isHittingNote = false
    //score for the level (hit notes)
    var score = 0
    
    //AudioKit Helper Initialisation
    let audioHelper = AudioHelper()
    
    //AudioKit declaration
    var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    
    //timer blm dipakai
    var scoringDelayTimer =  Timer()
    var updateUITimer = Timer()

    var song = Song0(songName: "Nina Bobo", bpm: 60)
    
    //song configuration
    let bpm: Float = 60.0 //in beat per seconds
    var crochet: Float = 0.0 //in seconds
    var noteLength: Float = 100.0 //note length in points
    var maxFrequency: Float = 493.889050 //b4
    var minFrequency: Float = 98.0 //g2
    //how much note is in the frequency range
    let noteNumber = 29
    
    //base view dimension
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .backgroundColor
        
        BaseView.backgroundColor = .clear
        crochet = 60.0/bpm //in seconds
        
        width = BaseView.frame.width
        height = BaseView.frame.height
        
//        audioHelper.configure()
        configure()
        drawVerticalLines()
        configureNotes()
        configureUI()
        drawHorizontalLines()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        RoundingNotes()
        
        //setting up audiokit and audioSessions
        do {
            try AudioKit.stop()
            AudioKit.output = silence
            try AudioKit.start()
            
            audioHelper.configureAudioSession()
            audioHelper.playAudio(fileName: "Ninabobo", type: "wav")
        } catch {
            AKLog("error")
        }
        
        updateUITimer = Timer.scheduledTimer(timeInterval: 0.01,
                                             target: self,
                                             selector: #selector(updateUI),
                                             userInfo: nil,
                                             repeats: true)
    }
    
    
    fileprivate func RoundingNotes() {
        for note in notes {
            note.layer.cornerRadius = note.frame.height/4
            note.clipsToBounds = true
            note.layer.masksToBounds = true
            note.layer.borderColor = UIColor.textColor.cgColor
            note.layer.borderWidth = 0.5
        }
    }
    
    fileprivate func configureNotes() {
        let distanceBeforeStart = 4 * noteLength
        
        notes = song.notes
        
        for (index, note) in notes.enumerated() { //notes.enumerated()
            
            view.addSubview(note)
            
            //            let previousLeading = index == 0 ? view.trailingAnchor : notes[index-1].trailingAnchor
            let previousLeading = index == 0 ? verticalLine.centerXAnchor : notes[index-1].trailingAnchor
            //            let previousDistance = index == 0 ? 0 : notes[index-1].note.distance
            let previousDistance = index == 0 ? distanceBeforeStart : notes[index-1].note.distance
            note.widthAnchor.constraint(equalToConstant: CGFloat(note.duration*noteLength)).isActive = true
            note.heightAnchor.constraint(equalToConstant: self.height/CGFloat((noteNumber-1))*0.8).isActive = true
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
                lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
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
            //            verticalLine.leadingAnchor.constraint(equalTo: BaseView.leadingAnchor, constant: width/8)
            verticalLine.centerXAnchor.constraint(equalTo: BaseView.leadingAnchor, constant: width/8)
            ])
    }
    
    //configure AudioKit
    func configure() {
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
        AKSettings.audioInputEnabled = true
    }
    
    //configure UI
    func configureUI() {
        indicate.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        indicate.center = CGPoint(x: width/8, y: 0)
//        indicate.image = UIImage(named: "indicator")
        indicate.layer.cornerRadius = indicate.frame.height/2
        indicate.backgroundColor = .black
        view.addSubview(indicate)
    }
    
    @objc func updateUI() {
        if tracker.amplitude > 0.1 {
            frequencyLabel.text = String(format: "%0.1f", tracker.frequency)

            var frequency = Float(tracker.frequency)
            while (frequency > Float(MusicConstants.noteFrequencies[MusicConstants.noteFrequencies.count-1])) {
                frequency = frequency / 2.0
            }
            while (frequency < Float(MusicConstants.noteFrequencies[0])) {
                frequency = frequency * 2.0
            }

            var minDistance: Float = 10000.0
            var index = 0

            for i in 0..<MusicConstants.noteFrequencies.count {
                let distance = fabsf(Float(MusicConstants.noteFrequencies[i]) - frequency)
                if (distance < minDistance){
                    index = i
                    minDistance = distance
                }
            }
            let octave = Int(log2f(Float(tracker.frequency) / frequency))
            //            noteNameWithSharpsLabel.text = "\(noteNamesWithSharps[index])\(octave)"
            //            noteNameWithFlatsLabel.text = "\(noteNamesWithFlats[index])\(octave)"
            //            print("\(noteNameWithSharpsLabel.text!) f=\(tracker.frequency) A=\(tracker.amplitude)")
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.indicate.center.y = self.height + self.BaseView.frame.origin.y - self.getCentsInterval(voiceFrequency: self.tracker.frequency, self.minFrequency, self.maxFrequency) * self.height
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.indicate.center.y = self.BaseView.frame.origin.y + self.height + self.indicate.frame.height*2 //-  (self.indicate.frame.height/2)
            }, completion: nil)
        }
        //        amplitudeLabel.text = String(format: "%0.2f", tracker.amplitude)
        noteAlgorithm()
    }
//
//    func createTrails() {
//        let trailView = UIView(frame: CGRect(width: 2, height: 2))
//        view.addSubview(trailView)
//        trailView.center = indicate.center
//        trailView.layer.cornerRadius = trailView.frame.width/2
//        trailView.backgroundColor = .black
//    }
    
    func getCentsInterval(voiceFrequency: Double, _ minFrequency: Float, _ maxFrequency: Float) -> CGFloat {
        let f1 = CGFloat(log2(voiceFrequency/minFrequency) * 1200)
        let f2 = CGFloat(log2(maxFrequency/minFrequency) * 1200)
        let cent = f1/f2
        return cent
    }
    
    //cek note dibenerin nding anjay
    func noteAlgorithm() {
        animateNoteChart()
        checkNoteIfHit()
        songEnding()
    }
    
    fileprivate func animateNoteChart() {
        //animating notes from right to left /100 speed/note length
        UIView.animate(withDuration: 0.01, animations: {
            for note in self.notes {
                note.center.x -= 1
            }
        })
    }
    
    fileprivate func checkNoteIfHit() {
        for note in notes {
            if indicate.center.y > note.center.y - (indicate.frame.height/2) && indicate.center.y < note.center.y + (indicate.frame.height/2) && indicate.frame.intersects(note.frame){ //
                isHittingNote = true
                if isHittingNote {
                    //timer berapa detik kalo lebih dari duration bikin noteisHit jadi true
                    indicate.backgroundColor = .lightGray
                    //start timer
                    scoringDelayTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(note.duration/2), repeats: false, block: { (Timer) in
                        note.note.isHit = true
                    })
                    print(note.note.pitch, note.note.isHit)
                } else {
                    //stop timer
                    scoringDelayTimer.invalidate()
                    //changing color still error!!!!
                    indicate.backgroundColor = .black
                }
            } else {
                isHittingNote = false
                indicate.backgroundColor = .black
            }
        }

    }
    
    fileprivate func songEnding() {
        if song.notes.last!.center.x < -100 {
            for note in self.notes {
                if note.note.isHit {
                    score += 1
                }
                print(note.note.pitch, note.note.isHit)
                note.removeFromSuperview()
            }
            print("True \(score), False \(notes.count-score), \(notes.count)")
            print("End of Game")
            updateUITimer.invalidate()
//            do {
//                try AudioKit.stop()
//                audioHelper.stopAudio()
//
//            } catch {
//                AKLog("Error")
//            }
            //End of Game present next VC and calculate points
            //put function here to calculate points
            //            for (index,note) in notes.enumerated() {
            //                if notes[index].note.isHit {
            //                    score += 1
            //                }
            //            }
            //put function here to present next VC beforehand prepare data for segue
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        let nextVC = UIStoryboard.instatiateViewController
        
    }
}

