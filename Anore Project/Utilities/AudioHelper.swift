//
//  AudioHelper.swift
//  Anore Project
//
//  Created by Josiah Elisha on 18/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import AVFoundation
import AudioKit

class AudioHelper {
    
    static let shared = AudioHelper()
    
    var audioPlayer = AVAudioPlayer()
    var audioSession = AVAudioSession()
    
    func playAudio(fileName: String, type: String) {
        let sound = Bundle.main.path(forResource: fileName, ofType: type)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            audioPlayer.prepareToPlay()
        } catch {
            print(error)
        }
        
        audioPlayer.play()
    }
    
    func configureAudioSession() {
        do {
//            try audioSession.overrideOutputAudioPort(.speaker)
//            try audioSession.setActive(true)
            try AKSettings.session.overrideOutputAudioPort(.speaker)
            try AKSettings.session.setActive(true)
        } catch {
            print("Error")
        }
    }
    
    func pauseAudio() {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        } else {
            
        }
    }
    func stopAudio() {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
            do {
//                try audioSession.setActive(false)
                try AKSettings.session.setActive(false)
            } catch {
                print("Error")
            }
        }


    }
    
}
