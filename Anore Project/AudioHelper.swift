//
//  AudioHelper.swift
//  Anore Project
//
//  Created by Josiah Elisha on 18/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import AVFoundation

class AudioHelper {
    
    var audioPlayer = AVAudioPlayer()
    var audioSession = AVAudioSession()
    
    func playAudio(fileName: String, type: String) {
        let sound = Bundle.main.path(forResource: fileName, ofType: type)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        } catch {
            print("Error")
        }
        
        audioPlayer.play()
    }
    
    func configureAudioSession() {
        do {
            try audioSession.overrideOutputAudioPort(.speaker)
            try audioSession.setActive(true)
        } catch {
            print("Error")
        }
    }
    func stopAudio() {
        audioPlayer.stop()
        do {
            try audioSession.setActive(false)
        } catch {
            print("Error")
        }

    }
    
}
