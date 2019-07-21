//
//  BeforeMenuViewController.swift
//  Anore Project
//
//  Created by Josiah Elisha on 21/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class BeforeMenuViewController: UIViewController {
        
    @IBOutlet weak var home: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func home(_ sender: UIButton) {
        isLoggedIn = true
        saveLoginState()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let nextVc = MenuViewController(collectionViewLayout: layout)
        nextVc.modalTransitionStyle = .crossDissolve
        present(nextVc, animated: true, completion: nil)
    }
    
    func saveLoginState() {
        UserDefaults.standard.set(isLoggedIn, forKey: Keys.loginState)
    }
}
