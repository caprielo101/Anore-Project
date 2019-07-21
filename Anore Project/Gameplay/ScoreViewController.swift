//
//  ScoreViewController.swift
//  Anore Project
//
//  Created by Josiah Elisha on 19/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    var label = UILabel()
    
    var currentTime: CFTimeInterval = 0
    var timer = Timer()
    var loadingTime:CFTimeInterval = 1.5
    
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var hitLabel: UILabel!
    @IBOutlet weak var missLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var congratsLabel: UILabel!
    var center: CGPoint = .zero
    
    var accuracy: CGFloat = 0.0
    
    var missNotes = 0
    var hitNotes = 0
    var totalNotes = 0
    
    var song: AllSongs?
    
    var delegate: SongSelectionCellDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hubungin ke core data
        //( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)( ͡° ͜ʖ ͡°)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        var best = song?.bestScore
        let name = String(song!.songName)
////        best = Float(accuracy*100)
        song?.bestScore = CGFloat(accuracy) * 2 * .pi
//        print("Before defaults: \(song?.bestScore)", name)
        switch name {
        case "ascending":
//            UserDefaults.standard.set(song?.bestScore, forKey: "warmup1")
            Score.warmup1 = song!.bestScore
        case "descending":
//            UserDefaults.standard.set(song?.bestScore, forKey: "warmup2")
            Score.warmup2 = song!.bestScore
        case "interval":
//            UserDefaults.standard.set(song?.bestScore, forKey: "warmup3")
            Score.warmup3 = song!.bestScore

        case "twinkle-twinkle little star":
//            UserDefaults.standard.set(song?.bestScore, forKey: "song1")
            Score.song1 = song!.bestScore

        case "nina bobo":
//            UserDefaults.standard.set(song?.bestScore, forKey: "song2")
            Score.song2 = song!.bestScore

        case "balonku":
//            UserDefaults.standard.set(song?.bestScore, forKey: "song3")
            Score.song3 = song!.bestScore

        case "ode to joy":
            Score.song4 = song!.bestScore
        default:
            return
//            UserDefaults.standard.set(song?.bestScore, forKey: name)
        }
//        print(UserDefaults.standard.float(forKey: "warmup1"),
//              UserDefaults.standard.float(forKey: "warmup2"),
//              UserDefaults.standard.float(forKey: "warmup3"),
//              UserDefaults.standard.float(forKey: "song1"),
//              UserDefaults.standard.float(forKey: "song2"),
//              UserDefaults.standard.float(forKey: "song3"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        center = CGPoint(x: view.center.x, y: view.center.y/2)
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -0.5*CGFloat.pi, endAngle: 1.5*CGFloat.pi, clockwise: true)
        
        createTrackLayer(circularPath)
        createShapeLayer(circularPath)
        createLabel()
        ShowLoadingOverlay()
        
        if hitNotes != totalNotes {
            hitLabel.text = "you hit \(hitNotes) out of \(totalNotes)"
            missLabel.text = "but you missed \(missNotes.asWord) notes"
        } else {
            hitLabel.text = "you hit \(hitNotes) out of \(totalNotes)"
            missLabel.text = "you didn't miss a note!"
        }
        
        congratsLabel.text = giveMessage(if: accuracy)

        debugPrint(hitNotes, missNotes, totalNotes, accuracy)
    }
    
    func giveMessage(if accuracy: CGFloat) -> String {
        let acc = Int(accuracy*100)
        switch acc {
        case 0...50:
            return "don't give up! you can do it!"
        case 51..<75:
            return "you are doing a great job,\nkeep it up!"
        case 75..<85:
            return "you sing pretty well! nice job!"
        case 85...99:
            return "wow doing great eh? nice notes you got there."
        case 100:
            return "excellent! a perfect score! \nyou. are. awesome."
        default:
            return ""
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: loadingTime/Double((accuracy*100)), target: self, selector: #selector(progressAdding), userInfo: nil, repeats: true)
    }
    //( ͡° ͜ʖ ͡°)
    @objc func progressAdding() {
        if currentTime < loadingTime {
            if accuracy == 0 {
                label.text = "0%"
                timer.invalidate()
            } else {
                currentTime += loadingTime/(CFTimeInterval(accuracy)*100)
                label.text = "\(Int(currentTime/loadingTime*(CFTimeInterval(accuracy)*100)))%"
            }
        } else {
            currentTime = loadingTime
            label.text = "\(Int(accuracy*100))%"
            print(currentTime)
            timer.invalidate()
        }
    }
    
    func ShowLoadingOverlay() {
        startTimer()
        let loading = CABasicAnimation(keyPath: "strokeEnd")
        loading.toValue = accuracy
        loading.duration = CFTimeInterval(loadingTime)
        loading.fillMode = .forwards
        loading.isRemovedOnCompletion = false
        shapeLayer.add(loading, forKey: "loading")
    }
    
    fileprivate func createTrackLayer(_ circularPath: UIBezierPath) {
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.init(white: 4.5/5, alpha: 1).cgColor
        trackLayer.lineWidth = 20
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
    }
    
    fileprivate func createShapeLayer(_ circularPath: UIBezierPath) {
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.greenColor.cgColor
        shapeLayer.lineWidth = 20
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .square
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
    }
    
    //Creating the label to animate then
    func createLabel() {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = "0%"
        label.font = UIFont.init(name: "Young", size: 40)
        label.textColor = UIColor.textColor
        label.textAlignment = .center
        label.center = center
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
    }
    
    @IBAction func retry(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let retryVc = storyboard.instantiateViewController(withIdentifier: "gameplay") as! ViewController
        retryVc.song = song
        present(retryVc, animated: true, completion: nil)
    }
    
    @IBAction func home(_ sender: Any) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let nextVc = MenuViewController(collectionViewLayout: layout)
        present(nextVc, animated: true, completion: nil)
    }
    
}
