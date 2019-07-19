//
//  MenuViewController.swift
//  Anore Project
//
//  Created by Josiah Elisha on 19/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MenuViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
//    var songs: [Song] {
//        return [Song0(), Song1(), Song3()]
//    }
    var songs: [AllSongs] {
        return [SongOne(name: "Ngaco", maxFreq: MusicConstants.noteFrequencies[0] * pow(2, 4), minFreq: MusicConstants.noteFrequencies[0] * pow(2, 3), noteNumber: 13)]
    }
    
    var songSelection: [SongSelection]!
    
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        songSelection = [
            SongSelection(imageName: "warm up", songText: "warm up", song: SongOne(name: "warm up", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "twinkle", songText: "twinkle-twinkle little star", song: SongOne(name: "twinkle-twinkle little star", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "nina bobo", songText: "nina bobo", song: SongTwo(name: "nina bobo", maxFreq: MusicConstants.noteFrequencies[7]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[7]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "balonku", songText: "balonku", song: SongOne(name: "balonku", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13))
        ]
        // Register cell classes
        collectionView?.backgroundColor = .backgroundColor
        collectionView?.register(SongSelectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.isPagingEnabled = true
        // Do any additional setup after loading the view.
    }

    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         let destination = segue.destination as! ViewController
//        destination.song = songs[indexPath!.item]
//    }
    

}
extension MenuViewController: SongSelectionCellDelegate {
    func didTapButton(song: AllSongs) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVc = storyboard.instantiateViewController(withIdentifier: "gameplay") as! ViewController
        nextVc.song = song
        present(nextVc, animated: true, completion: nil)
    }
}
extension MenuViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songSelection.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SongSelectionCell

        let songChoice = songSelection[indexPath.item]
        cell.songSelection = songChoice
//        cell.playButton.addTarget(getInstance(), action: #selector(goToVc), for: .touchUpInside)
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    @objc func goToVc(sender: UIButton) {
        let cell: SongSelectionCell = sender.superview as! SongSelectionCell
        indexPath = self.collectionView.indexPath(for: cell)!
        
        if indexPath == nil {
            assert(false)
            return
        }
        print("go to \(indexPath!.item)")
//        performSegue(withIdentifier: "Next", sender: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVc = storyboard.instantiateViewController(withIdentifier: "gameplay")
//        nextVc.delegate = self
        present(nextVc, animated: true, completion: nil)
    }
    
}
