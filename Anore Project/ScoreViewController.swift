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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        center = CGPoint(x: view.center.x, y: view.center.y/2)
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -0.5*CGFloat.pi, endAngle: 1.5*CGFloat.pi, clockwise: true)
        
        createTrackLayer(circularPath)
        
        createShapeLayer(circularPath)
        
        createLabel()
        
        ShowLoadingOverlay()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        hitLabel.text = "hit: \(hitNotes)/\(totalNotes)"
        missLabel.text = "miss: \(missNotes)/\(totalNotes)"
        
        debugPrint(hitNotes, missNotes, totalNotes, accuracy)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: loadingTime/100, target: self, selector: #selector(progressAdding), userInfo: nil, repeats: true)
    }
    
    @objc func progressAdding() {
        if currentTime < loadingTime {
//            currentTime += loadingTime/(CFTimeInterval(accuracy)*100)
//            label.text = "\(Int(currentTime/loadingTime/(CFTimeInterval(accuracy)*100)))%"
            currentTime += loadingTime/(CFTimeInterval(accuracy)*100)
            label.text = "\(Int(currentTime/loadingTime*(CFTimeInterval(accuracy)*100)))%"
            print(currentTime)
        } else {
            currentTime = loadingTime
            label.text = "\(Int(accuracy*100))%"
            print(currentTime)
        }
        
//        if currentTime >= loadingTime - (loadingTime/100) {
//            shapeLayer.strokeColor = UIColor.green.cgColor
//            view.isUserInteractionEnabled = true
//        } else {
//            view.isUserInteractionEnabled = false
//        }
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
        shapeLayer.strokeColor = UIColor.green.cgColor
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
        //        label.minimumScaleFactor = 0.5
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
