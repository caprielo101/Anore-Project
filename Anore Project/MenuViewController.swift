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
    //    var songs: [AllSongs] {
    //        return [SongOne(name: "Ngaco", maxFreq: MusicConstants.noteFrequencies[0] * pow(2, 4), minFreq: MusicConstants.noteFrequencies[0] * pow(2, 3), noteNumber: 13)]
    //    }
    //
    var songSelection: [SongSelection]!
    
    //    var indexPath: IndexPath?
    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, songSelection.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = songSelection.count
        pc.currentPageIndicatorTintColor = .blue
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        //         self.clearsSelectionOnViewWillAppear = false
        songSelection = [
            SongSelection(imageName: "warm up", songText: "ascending notes", song: AscendingNotes(name: "ascending", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "warm up", songText: "descending notes", song: DescendingNotes(name: "descending", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "warm up", songText: "interval notes", song: IntervalNotes(name: "interval", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "twinkle", songText: "twinkle-twinkle little star", song: SongOne(name: "twinkle-twinkle little star", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "nina bobo", songText: "nina bobo", song: SongTwo(name: "nina bobo", maxFreq: MusicConstants.noteFrequencies[7]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[7]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "balonku", songText: "balonku", song: SongThree(name: "balonku", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "balonku", songText: "balonku", song: SongThree(name: "balonku", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "balonku", songText: "balonku", song: SongThree(name: "balonku", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "balonku", songText: "balonku", song: SongThree(name: "balonku", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "balonku", songText: "balonku", song: SongThree(name: "balonku", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13)),
            SongSelection(imageName: "balonku", songText: "balonku", song: SongThree(name: "balonku", maxFreq: MusicConstants.noteFrequencies[0]*pow(2, 4), minFreq: MusicConstants.noteFrequencies[0]*pow(2, 3), noteNumber: 13))
        ]
        //setting up the label
        setupInterface()
        // Register cell classes
        collectionView?.backgroundColor = .backgroundColor
        collectionView?.register(SongSelectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.isPagingEnabled = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setupInterface() {
        let label = UILabel()
        view.addSubview(label)
        label.textAlignment = .center
        label.text = "song selection"
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
        NSLayoutConstraint.activate([
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            line.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            line.heightAnchor.constraint(equalToConstant: 0.5)
            ])
        
        let chevronRight = UIButton(type: .system)
        view.addSubview(chevronRight)
        //        chevronRight.setImage(#imageLiteral(resourceName: "next"), for: .normal)
        chevronRight.translatesAutoresizingMaskIntoConstraints = false
        chevronRight.setBackgroundImage(UIImage(named: "next"), for: .normal)
        NSLayoutConstraint.activate([
            chevronRight.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            chevronRight.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            chevronRight.widthAnchor.constraint(equalToConstant: 25),
            chevronRight.heightAnchor.constraint(equalToConstant: 65)
            ])
        chevronRight.tintColor = .init(r: 160, g: 160, b: 160)
        chevronRight.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        let chevronLeft = UIButton(type: .system)
        view.addSubview(chevronLeft)
        //        chevronLeft.setImage(#imageLiteral(resourceName: "prev"), for: .normal)
        chevronLeft.setBackgroundImage(UIImage(named: "prev"), for: .normal)
        chevronLeft.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chevronLeft.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            chevronLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            chevronLeft.widthAnchor.constraint(equalToConstant: 25),
            chevronLeft.heightAnchor.constraint(equalToConstant: 65)
            ])
        chevronLeft.tintColor = .init(r: 160, g: 160, b: 160)
        chevronLeft.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
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
        print(nextVc.song, song)
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
        cell.delegate = self
        
        let songChoice = songSelection[indexPath.item]
        cell.songSelection = songChoice
        //        cell.circleViewGreen.endAngle = CGFloat(songSelection[indexPath.item].song.bestScore) * 2/100 * .pi
        let name = songChoice.song.songName
        
        //        print(cell, cell.circleViewGreen.endAngle)
        //        cell.circleViewGreen.endAngle = CGFloat(UserDefaults.standard.float(forKey: songSelection[indexPath.item].song.songName)) / 100 * 2 * CGFloat.pi
        
        cell.circleViewGreen.endAngle = CGFloat(UserDefaults.standard.float(forKey: name))/100*CGFloat.pi*2
        print(name, UserDefaults.standard.float(forKey: name), cell.circleViewGreen.endAngle)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
