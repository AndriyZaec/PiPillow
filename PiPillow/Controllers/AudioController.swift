//
//  AudioController.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 30.06.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import Foundation
import AVFoundation

class AudioController {
    
    var player: AVAudioPlayer?
    var isLoop: Bool = false
    
    init(loadAudioWithName fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func play() {
        if player?.isPlaying == false {
            player?.play()
        }
    }
    
    func pause() {
        player?.pause()
    }
    
    func stop() {
        player?.stop()
    }
    
    @objc func reachTheEndOfTheAudio(_ notification: Notification) {
        if isLoop {
            player?.numberOfLoops = -1
        }
    }
    
}
