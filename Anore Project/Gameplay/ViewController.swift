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
    //( ͡° ͜ʖ ͡°)
    //debugging labels
    @IBOutlet weak var amplitudeLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var noteNameWithFlatsLabel: UILabel!
    @IBOutlet weak var noteNameWithSharpsLabel: UILabel!
    
    //base view for gameplay (container view)
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var pauseButton: UIButton!
    
    var songNameLabel = UILabel(frame: .zero)
    
    //need to make note array (note view array) variables
    var notes: [NoteView] = []
    
    //small circle for indicator (biji bulat kecil)
    //    private let indicate =  UIView()
    private let indicate = UIImageView()
    private let verticalLine = LineView()
    private let pauseView = UIView()
    private let overlayView = UIView()
    //boolean value for checking if note is hit
    var isHittingNote = false
    //score for the level (hit notes)
    var score = 0
    
    //AudioKit declaration
    var mic: AKMicrophone!
    var tracker: AKFrequencyTracker!
    var silence: AKBooster!
    
    //timer blm dipakai
    var scoringDelayTimer =  Timer()
    var updateUITimer = Timer()

    //song declaration
    var song: AllSongs!

    //song configuration
    let bpm: Float = 60.0 //in beat per seconds
    var crochet: Float = 0.0 //in seconds
    var noteLength: Float = 100.0 //note length in points
    var maxFrequency: Float = 0.0
    var minFrequency: Float = 0.0
    var noteNumber = 0
    //base view dimension
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .bottom
    }
    
    private func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func handleForeground() {
        updateUITimer.invalidate()
        AudioHelper.shared.stopAudio()
        do {
            try AudioKit.stop()
        } catch {
            AKLog("error")
        }
        _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (Timer) in
            self.configureNotesDidLoad()
            self.configureNotesDidAppear()
            self.setupAudioKitAudioSession()
            self.startUpdateUITimer()
            self.view.bringSubviewToFront(self.overlayView)
            self.view.bringSubviewToFront(self.pauseView)
            self.view.bringSubviewToFront(self.indicate)
        })
    }
    
    fileprivate func configureLabel() {
        songNameLabel.text = song.songName
        view.addSubview(songNameLabel)
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        songNameLabel.font = UIFont(name: "Young", size: 22)
        songNameLabel.textColor = .textColor
        songNameLabel.textAlignment = .center
        songNameLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            songNameLabel.centerYAnchor.constraint(equalTo: pauseButton.centerYAnchor, constant: 0),
            songNameLabel.heightAnchor.constraint(equalToConstant: 50),
            songNameLabel.trailingAnchor.constraint(equalTo: pauseButton.leadingAnchor, constant: -20),
            songNameLabel.leadingAnchor.constraint(equalTo: verticalLine.trailingAnchor, constant: 20)
            ])
    }
    
    @objc func handlePause(_ sender: UIButton) {
        overlayView.alpha = 0
        overlayView.isHidden = true
        pauseView.isHidden = true
        switch sender.tag {
        case 1:
            startUpdateUITimer()
            AudioHelper.shared.audioPlayer.play()
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.pauseView.center.y += 150
            }, completion: nil)
            print(sender.tag)
            
        case 2:
            //do retry
            updateUITimer.invalidate()
            AudioHelper.shared.stopAudio()
            do {
                try AudioKit.stop()
            } catch {
                AKLog("error")
            }
            _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { (Timer) in
                self.configureNotesDidLoad()
                self.configureNotesDidAppear()
                self.setupAudioKitAudioSession()
                self.startUpdateUITimer()
                self.view.bringSubviewToFront(self.overlayView)
                self.view.bringSubviewToFront(self.pauseView)
                self.view.bringSubviewToFront(self.indicate)
            })
 
            print(sender.tag)
        case 3:
            //open the are you sure tab
            
            //go to home
            updateUITimer.invalidate()
            AudioHelper.shared.stopAudio()
            do {
                try AudioKit.stop()
            } catch {
                AKLog("error")
            }
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let nextVc = MenuViewController(collectionViewLayout: layout)
            nextVc.modalTransitionStyle = .crossDissolve
            present(nextVc, animated: true, completion: nil)
            
            print(sender.tag)
        default:
            return
        }
    }
    
    fileprivate func configurePauseView() {

        view.addSubview(overlayView)
        view.addSubview(pauseView)
        view.bringSubviewToFront(overlayView)
        view.bringSubviewToFront(pauseView)
        overlayView.isHidden = true
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.0
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        pauseView.isHidden = true
        pauseView.backgroundColor = .init(r: 235, g: 235, b: 235)
        pauseView.translatesAutoresizingMaskIntoConstraints = false
        
        let resumeButton = UIButton(type: .custom)
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        resumeButton.setBackgroundImage(#imageLiteral(resourceName: "resumeButton"), for: .normal)
        resumeButton.setTitle("", for: .normal)
        resumeButton.tag = 1
        resumeButton.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        
        let retryButton = UIButton(type: .custom)
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        retryButton.setBackgroundImage(#imageLiteral(resourceName: "retryButton"), for: .normal)
        retryButton.setTitle("", for: .normal)
        retryButton.tag = 2
        retryButton.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        
        let homeButton = UIButton(type: .custom)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.setBackgroundImage(#imageLiteral(resourceName: "homeButton"), for: .normal)
        homeButton.setTitle("", for: .normal)
        homeButton.tag = 3
        homeButton.addTarget(self, action: #selector(handlePause), for: .touchUpInside)

        let pauseStackView = UIStackView(arrangedSubviews: [resumeButton, retryButton, homeButton])
        pauseStackView.translatesAutoresizingMaskIntoConstraints = false
        pauseStackView.distribution = .equalSpacing
        
        pauseView.addSubview(pauseStackView)
        
        let pauseLabel = UILabel()
        pauseView.addSubview(pauseLabel)
        pauseLabel.translatesAutoresizingMaskIntoConstraints = false
        pauseLabel.text = "paused"
        pauseLabel.font = UIFont(name: "Young", size: 22)
        pauseLabel.numberOfLines = 0
        pauseLabel.textAlignment = .center
        pauseLabel.textColor = .textColor
        
        NSLayoutConstraint.activate([

            pauseView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            pauseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            pauseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            pauseView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15),
            
            pauseStackView.bottomAnchor.constraint(equalTo: pauseView.bottomAnchor, constant: -20),
            pauseStackView.leadingAnchor.constraint(equalTo: pauseView.leadingAnchor, constant: 25),
            pauseStackView.trailingAnchor.constraint(equalTo: pauseView.trailingAnchor, constant: -25),
            pauseStackView.heightAnchor.constraint(equalTo: pauseView.heightAnchor, multiplier: 0.4),
            
            resumeButton.widthAnchor.constraint(equalTo: resumeButton.heightAnchor, multiplier: 1),
            retryButton.widthAnchor.constraint(equalTo: retryButton.heightAnchor, multiplier: 1),
            homeButton.widthAnchor.constraint(equalTo: homeButton.heightAnchor, multiplier: 1),
            
            pauseLabel.topAnchor.constraint(equalTo: pauseView.topAnchor, constant: 20),
            pauseLabel.leadingAnchor.constraint(equalTo: pauseView.leadingAnchor),
            pauseLabel.trailingAnchor.constraint(equalTo: pauseView.trailingAnchor),
            pauseLabel.heightAnchor.constraint(equalTo: pauseView.heightAnchor, multiplier: 0.2),
            
            overlayView.topAnchor.constraint(equalTo: view.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotificationObservers()
        
        view.backgroundColor = .backgroundColor
        maxFrequency = song.maxFreq
        minFrequency = song.minFreq
        noteNumber = song.noteNumber
        crochet = song.crochet//60.0/bpm //in seconds
        baseView.backgroundColor = .clear

        width = baseView.frame.width
        height = baseView.frame.height
        
        configure()
        drawVerticalLines()
        configureNotesDidLoad()
        configureUI()
        drawHorizontalLines()
        configureLabel()
        
        configurePauseView()

    }
    
    fileprivate func startUpdateUITimer() {
        updateUITimer = Timer.scheduledTimer(timeInterval: 0.01,
                                             target: self,
                                             selector: #selector(updateUI),
                                             userInfo: nil,
                                             repeats: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureNotesDidAppear()
        //setting up audiokit and audioSessions
        setupAudioKitAudioSession()
        
        startUpdateUITimer()
    }
    
    fileprivate func setupAudioKitAudioSession() {
        do {
            AudioKit.output = silence
            try AudioKit.start()
            AudioHelper.shared.configureAudioSession()
            switch song.songName {
            case "nina bobo":
                AudioHelper.shared.playAudio(fileName: "Ninabobo", type: "wav")
            case "twinkle-twinkle little star":
                AudioHelper.shared.playAudio(fileName: "twinkle", type: "wav")
            case "balonku":
                AudioHelper.shared.playAudio(fileName: "balonku-60", type: "wav")
            case "ascending":
                AudioHelper.shared.playAudio(fileName: "AscendingNotes", type: "wav")
            case "descending":
                AudioHelper.shared.playAudio(fileName: "DescendingNotes", type: "wav")
            case "interval":
                AudioHelper.shared.playAudio(fileName: "IntervalNotes", type: "wav")
            case "ode to joy":
                AudioHelper.shared.playAudio(fileName: "OdeToJoy", type: "wav")
            default:
                AudioHelper.shared.playAudio(fileName: "", type: "wav")
            }
        } catch {
            AKLog("error")
        }
    }
    
    fileprivate func configureNotesDidAppear() {
        for note in notes {
            note.layer.cornerRadius = note.frame.height/4
            note.clipsToBounds = true
            note.layer.masksToBounds = true
            note.layer.borderColor = UIColor.textColor.cgColor
            note.layer.borderWidth = 1
            note.isHidden = false
            note.alpha = 1
            note.backgroundColor = NoteView.giveColor(note)()
        }
        pauseView.layer.cornerRadius = pauseView.frame.height/4
        pauseView.layer.masksToBounds = true
    }
    
    fileprivate func configureNotesDidLoad() {
        var distanceBeforeStart: Float = 0.0
        switch song.songName {
        case "balonku":
            distanceBeforeStart = bpm/song.bpm * 3 * noteLength
        case "ode to joy":
            distanceBeforeStart = bpm/song.bpm * 4 * noteLength
        default:
            distanceBeforeStart = bpm/song.bpm * 4 * noteLength
        }
        
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
            note.centerYAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -(CGFloat(getCentsInterval(voiceFrequency: Double(note.note?.frequency ?? 0), minFrequency, maxFrequency))*height)).isActive = true
            note.translatesAutoresizingMaskIntoConstraints = false
            
        }
    }
    
    fileprivate func drawHorizontalLines() {
        let xVal: CGFloat = 0.0
        let yVall = height/CGFloat(noteNumber-1)
        
        for i in 0..<noteNumber {
            let lineView = LineView()
//            lineView.alpha = 0.3
            lineView.backgroundColor = .textColor
//            lineView.startPoint = CGPoint(x: xVal, y: yVall)
//            lineView.endPoint = CGPoint(x: baseView.frame.width, y: yVall)
            lineView.translatesAutoresizingMaskIntoConstraints = false
            baseView.addSubview(lineView)
            
            NSLayoutConstraint.activate([
                lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                lineView.topAnchor.constraint(equalTo: baseView.topAnchor, constant: CGFloat(i)*yVall),
                //                lineView.bottomAnchor.constraint(equalTo: BaseView.bottomAnchor, constant: -(yVall)),
                lineView.heightAnchor.constraint(equalToConstant: 1)
                ])
            //            yVal += CGFloat(BaseView.frame.height/noteNumber)
            //            yVall += BaseView.frame.height/CGFloat(noteNumber-1)
        }
    }
    
    fileprivate func drawVerticalLines() {
        
        verticalLine.backgroundColor = .textColor
        verticalLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalLine)
        
        NSLayoutConstraint.activate([
            verticalLine.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            verticalLine.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            verticalLine.widthAnchor.constraint(equalToConstant: 1),
            //            verticalLine.leadingAnchor.constraint(equalTo: BaseView.leadingAnchor, constant: width/8)
            verticalLine.centerXAnchor.constraint(equalTo: baseView.leadingAnchor, constant: width/8)
            ])
    }
    
    //configure AudioKit
    func configure() {
        AKSettings.audioInputEnabled = true
        mic = AKMicrophone()
        tracker = AKFrequencyTracker(mic)
        silence = AKBooster(tracker, gain: 0)
    }
    
    //configure UI
    func configureUI() {
        indicate.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        indicate.center = CGPoint(x: width/8, y: view.frame.height)
//        indicate.image = UIImage(named: "indicator")
        indicate.layer.cornerRadius = indicate.frame.height/2
        indicate.backgroundColor = .black
        view.addSubview(indicate)
    }
    
    @objc func updateUI() {
        let thresholdFrequency: Double = 30.0
        if tracker.amplitude > 0.1 && tracker.frequency > Double(minFrequency) - thresholdFrequency && tracker.frequency < Double(maxFrequency) + thresholdFrequency {
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
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
                self.indicate.center.y = self.height + self.baseView.frame.origin.y - self.getCentsInterval(voiceFrequency: self.tracker.frequency, self.minFrequency, self.maxFrequency) * self.height
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
                self.indicate.center.y = self.baseView.frame.origin.y + self.height + self.indicate.frame.height*2 //-  (self.indicate.frame.height/2)
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

        for note in notes {
            let startPoint = CGPoint(x: note.center.x, y: note.center.y)
            let endPoint = CGPoint(x: note.center.x - 1, y: note.center.y)
            let duration = 0.01

            let animation = constructAnimation(startPoint: startPoint, endPoint: endPoint, duration: duration)
            note.layer.add(animation, forKey: "pos")
            note.layer.position = endPoint
            
            if note.frame.origin.x * 1.2 < verticalLine.center.x - verticalLine.frame.width/2 {
                note.backgroundColor = .lightGray
                note.alpha = 0.5
            }
            if note.frame.maxX <= verticalLine.center.x - 10 {
                note.isHidden = true
            }
        }

    }
    
    func constructAnimation(startPoint: CGPoint, endPoint: CGPoint, duration: Double) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = startPoint
        animation.toValue = endPoint
        animation.duration = 0.01
        return animation
    }
    
    func checkNoteIfHit() {
        for note in notes {
            if indicate.center.y > note.center.y - (height/CGFloat(noteNumber-1)/6) && indicate.center.y < note.center.y + (height/CGFloat(noteNumber-1)/6) && indicate.frame.intersects(note.frame){ //
                isHittingNote = true
                if isHittingNote {
                    //timer berapa detik kalo lebih dari duration bikin noteisHit jadi true
                    //start timer
                    scoringDelayTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(note.duration/2), repeats: false, block: { (Timer) in
                        note.note.isHit = true
                        if self.isHittingNote == false {
                            self.scoringDelayTimer.invalidate()
                        }
                    })
                    print(note.note.pitch, note.note.isHit)
                } else {
                    //stop timer
                    scoringDelayTimer.invalidate()
                    //changing color still error!!!!
                }
            } else {
                isHittingNote = false
            }
        }

    }
    
    func songEnding() {
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
            do {
                try AudioKit.stop()
            } catch {
                print("Error")
            }
            updateUITimer.invalidate()
            AudioHelper.shared.stopAudio()
            //put function here to present next VC beforehand prepare data for segue
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVc = storyboard.instantiateViewController(withIdentifier: "score") as! ScoreViewController
            nextVc.totalNotes = notes.count
            nextVc.hitNotes = score
            nextVc.missNotes = notes.count - score
            nextVc.song = song
            nextVc.accuracy = CGFloat(score)/CGFloat(notes.count)
            present(nextVc, animated: true, completion: nil)
        }
    }
    
    @IBAction func pause(_ sender: UIButton) {
        updateUITimer.invalidate()
        AudioHelper.shared.pauseAudio()
        overlayView.isHidden = false
        pauseView.isHidden = false

        UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseInOut, animations: {
            self.pauseView.center.y = self.view.center.y
            self.overlayView.alpha = 0.7
        }, completion: nil)
    }
}

