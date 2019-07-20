//
//  SongSelectionCell.swift
//  Anore Project
//
//  Created by Josiah Elisha on 19/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import UIKit

protocol SongSelectionCellDelegate {
    func didTapButton(song: AllSongs)
}

class SongSelectionCell: UICollectionViewCell {
    
    var songItem: AllSongs!
    var delegate: SongSelectionCellDelegate?
    
    var songSelection: SongSelection? {
        didSet {
            guard let unwrapping = songSelection else { return }
            
            coverImageView.image = UIImage(named: unwrapping.imageName)
    
            songNameText.text = unwrapping.songText
            songNameText.textAlignment = .center
            songNameText.backgroundColor = .clear
        }
    }
    
    let coverImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //        imageView.contentMode = .scaleAspectFill
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "resumeButton"), for: .normal)
        button.setTitle("", for: .normal)
        return button
    }()
    
    let histogramButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "progressButtonWhite"), for: .normal)
        button.setTitle("", for: .normal)
        return button
    }()
    
    let songNameText: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Young", size: 26)
        label.textColor = .textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedButton(_ sender: UIButton) {
        delegate?.didTapButton(song: songSelection!.song)
    }
    
    @objc func handleHistogram() {
        //present histogram
        print("Handling tap on histogram")
    }
    private func setupLayout() {
        let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true //tadinya 0.5
        
        topImageContainerView.addSubview(coverImageView)
        coverImageView.centerYAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: -100).isActive = true
        coverImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor, constant: 0).isActive = true
        coverImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
   
        addSubview(songNameText)
        songNameText.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 50).isActive = true
        songNameText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        songNameText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        addSubview(playButton)
        playButton.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
        playButton.topAnchor.constraint(equalTo: songNameText.bottomAnchor, constant: 40).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        playButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        addSubview(histogramButton)
        histogramButton.addTarget(self, action: #selector(handleHistogram), for: .touchUpInside)
        histogramButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        histogramButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 40).isActive = true
        histogramButton.heightAnchor.constraint(equalTo: playButton.heightAnchor, multiplier: 0.6).isActive = true
        histogramButton.widthAnchor.constraint(equalTo: playButton.widthAnchor, multiplier: 0.6).isActive = true
    }
}
