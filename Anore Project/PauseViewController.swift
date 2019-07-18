//
//  PauseViewController.swift
//  Anore Project
//
//  Created by Josiah Elisha on 18/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class PauseViewController: UIViewController {

    @IBOutlet weak var pauseView: UIView!
    @IBOutlet weak var confirmationView: UIView!
    
    var centerYAnchor: NSLayoutConstraint?
    var leadingAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    var trailingAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmationView.isHidden = true
        pauseView.translatesAutoresizingMaskIntoConstraints = false
        pauseView.layer.cornerRadius = pauseView.frame.height/4
        confirmationView.layer.cornerRadius = confirmationView.frame.height/4
        pauseView.layer.masksToBounds = true
        confirmationView.layer.masksToBounds = true
        
        centerYAnchor = pauseView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150)
        leadingAnchor = pauseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80)
        trailingAnchor = pauseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80)
        heightAnchor = pauseView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15)
        centerYAnchor?.isActive = true
        leadingAnchor?.isActive = true
        trailingAnchor?.isActive = true
        heightAnchor?.isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        centerYAnchor?.constant = 0
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func resume(_ sender: UIButton) {
        centerYAnchor?.constant = 200
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func retry(_ sender: UIButton) {
        
    }
    @IBAction func home(_ sender: UIButton) {
        
    }
    
    
}
