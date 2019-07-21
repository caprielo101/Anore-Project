//
//  YourProgressViewController.swift
//  Anore Project
//
//  Created by Josiah Elisha on 21/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class YourProgressViewController: UIViewController {

    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    var percentageLabel = UILabel()
    var center = CGPoint.zero
    
    let hit: CGFloat = CGFloat(UserDefaults.standard.integer(forKey: "hitNotes"))
    let total: CGFloat = CGFloat(UserDefaults.standard.integer(forKey: "totalNotes"))
    
    var color: UIColor = .clear
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .backgroundColor
        
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        switch hit/total {
        case 0..<0.2:
            color = .red
        case 0.2..<0.5:
            color = .orange
        case 0.5..<0.75:
            color = .yellow
        case 0.75..<0.99:
            color = .green
        case 0.99...1:
            color = .greenColor
        default:
            color = .white
        }
        center = CGPoint(x: view.center.x, y: view.center.y*0.79)
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -0.5*CGFloat.pi, endAngle: 1.5*CGFloat.pi, clockwise: true)
        
        createTrackLayer(circularPath)
        createShapeLayer(circularPath)
        createLabel()
        
    }
    
    fileprivate func createTrackLayer(_ circularPath: UIBezierPath) {
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.init(white: 4.5/5, alpha: 1).cgColor
        trackLayer.lineWidth = 25
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
    }
    
    fileprivate func createShapeLayer(_ circularPath: UIBezierPath) {
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.greenColor.cgColor
        shapeLayer.lineWidth = 25
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .square
        shapeLayer.strokeEnd = hit/total//0.5
        view.layer.addSublayer(shapeLayer)
    }
    
    //Creating the label to animate then
    func createLabel() {
        percentageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        if hit == 0 || total == 0 {
            percentageLabel.text = "0%"
        } else {
            percentageLabel.text = "\(Int(hit*100/total))%"
        }
        
        percentageLabel.font = UIFont.init(name: "Young", size: 40)
        percentageLabel.textColor = UIColor.textColor
        percentageLabel.textAlignment = .center
        percentageLabel.center = center
        percentageLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(percentageLabel)
    }
    
    func setupLayout() {
        let label = UILabel()
        view.addSubview(label)
        label.textAlignment = .center
        label.text = "progress"
        label.font = UIFont(name: "Young", size: 40)
        label.textColor = .textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        
        let line = LineView()
        view.addSubview(line)
        line.backgroundColor = .textColor
        line.translatesAutoresizingMaskIntoConstraints = false
        
        let overall = UILabel()
        view.addSubview(overall)
        overall.text = "overall performance"
        overall.textAlignment = .left
        overall.font = UIFont(name: "Young", size: 22)
        overall.textColor = .textColor
        overall.translatesAutoresizingMaskIntoConstraints = false
        
        let critical = UILabel()
        view.addSubview(critical)
        critical.text = "critical notes"
        critical.textAlignment = .left
        critical.font = UIFont(name: "Young", size: 22)
        critical.textColor = .textColor
        critical.translatesAutoresizingMaskIntoConstraints = false
        
        let firstPitch = UILabel()
        firstPitch.text = "C"
        firstPitch.textAlignment = .left
        firstPitch.font = UIFont(name: "Young", size: 40)
        firstPitch.textColor = .textColor
        firstPitch.translatesAutoresizingMaskIntoConstraints = false
        
        let firstAccuracy = UILabel()
        firstAccuracy.text = "accuracy: 40%"
        firstAccuracy.textAlignment = .left
        firstAccuracy.font = UIFont(name: "Young", size: 20)
        firstAccuracy.textColor = .textColor
        firstAccuracy.translatesAutoresizingMaskIntoConstraints = false
        
        let firstStack = UIStackView(arrangedSubviews: [firstPitch, firstAccuracy])
        view.addSubview(firstStack)
        firstStack.distribution = .fillEqually
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        
        let secondPitch = UILabel()
        secondPitch.text = "D"
        secondPitch.textAlignment = .left
        secondPitch.font = UIFont(name: "Young", size: 40)
        secondPitch.textColor = .textColor
        secondPitch.translatesAutoresizingMaskIntoConstraints = false
        
        let secondAccuracy = UILabel()
        secondAccuracy.text = "accuracy: 20%"
        secondAccuracy.textAlignment = .left
        secondAccuracy.font = UIFont(name: "Young", size: 20)
        secondAccuracy.textColor = .textColor
        secondAccuracy.translatesAutoresizingMaskIntoConstraints = false
        
        let secondStack = UIStackView(arrangedSubviews: [secondPitch, secondAccuracy])
        view.addSubview(secondStack)
        secondStack.distribution = .fillEqually
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        
        let home = UIButton()
        view.addSubview(home)
        home.translatesAutoresizingMaskIntoConstraints = false
        home.setBackgroundImage(#imageLiteral(resourceName: "homeButton"), for: .normal)
        home.setTitle("", for: .normal)
        home.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            line.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            line.heightAnchor.constraint(equalToConstant: 0.5),
            
            overall.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 40),
            overall.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            overall.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            critical.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 75),
            critical.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            critical.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            firstStack.topAnchor.constraint(equalTo: critical.bottomAnchor, constant: 40),
            firstStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            firstStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            secondStack.topAnchor.constraint(equalTo: firstStack.bottomAnchor, constant: 30),
            secondStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            secondStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            home.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            home.heightAnchor.constraint(equalToConstant: 75),
            home.widthAnchor.constraint(equalTo: home.heightAnchor, multiplier: 1),
            home.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
            
            ])
        
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
