//
//  ScoreViewController.swift
//  Anore Project
//
//  Created by Josiah Elisha on 19/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var hitLabel: UILabel!
    @IBOutlet weak var missLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    
    var missNotes = 0
    var hitNotes = 0
    var totalNotes = 0
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hubungin ke core data
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hitLabel.text = "hit: \(hitNotes)/\(totalNotes)"
        missLabel.text = "miss: \(missNotes)/\(totalNotes)"
    }
    
    @IBAction func retry(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let retryVc = storyboard.instantiateViewController(withIdentifier: "gameplay")
//        present(retryVc, animated: true, completion: nil)
        performSegue(withIdentifier: "goToGame", sender: self)
    }
    
    @IBAction func home(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            //pass the data of the song
            print("Go To gameplay")
        } else if let destination = segue.destination as? PageViewController {
            //pass the data to home view controller
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
