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
        var button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "resumeButton"), for: .normal)
        button.setTitle("", for: .normal)
        return button
    }()
    
    let songNameText: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Young", size: 40)
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
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true //tadinya 0.5
        
        topImageContainerView.addSubview(coverImageView)
        //        coverImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        //        coverImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        coverImageView.centerYAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: -50).isActive = true
        coverImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor, constant: 0).isActive = true
        //Multiplier untuk gedein image
        coverImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.7).isActive = true
        
        
        addSubview(songNameText)
        playButton.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
        songNameText.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 20).isActive = true
        //descriptionTextView.topAnchor.constraint(equalTo: topAnchor , constant: 200).isActive = true
        //        songNameText.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        //        songNameText.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        songNameText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        songNameText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        //        songNameText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        //        playButton.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        addSubview(playButton)
        
        playButton.topAnchor.constraint(equalTo: songNameText.bottomAnchor, constant: 30).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        playButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
    }
}
