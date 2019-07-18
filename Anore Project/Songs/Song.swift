//
//  Song.swift
//  Anore Project
//
//  Created by Josiah Elisha on 18/07/19.
//  Copyright © 2019 Josiah Elisha. All rights reserved.
//

import Foundation

class Song {

    func freq(index: Int, octave: Float) -> Float {
        return MusicConstants.noteFrequencies[index] * pow(2, octave)
    }
}
