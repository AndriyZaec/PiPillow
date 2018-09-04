//
//  StarSoundViewController.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 30.05.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit
import AVKit

class StarSoundViewController: UIViewController {
    
    //MARK: - Properties
    
    public var starsound: String? {
        didSet {
            starsoundFile = starsound
        }
    }
    fileprivate var starsoundFile: String? {
        didSet {
            starsoundFile = starsoundFile?.replacingOccurrences(of: " ", with: "_")
            guard videoView != nil else { return }
            play(filesWithNames: starsoundFile ?? "Sea_shore")
        }
    }
    
    @IBOutlet weak var videoView: VideoView!
    @IBOutlet weak var musicControlButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = starsound
        }
    }
    @IBOutlet weak var alarmLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var batteryLabel: UILabel!
    
    var isPlaying = true
    
    var audioPlayer: AudioController?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Privates
    
    fileprivate func play(filesWithNames fileName: String) {
        // Video setup
        videoView.player = nil
        videoView.playerLayer = nil
        let localUrl = Bundle.main.bundleURL.appendingPathComponent("\(fileName).mp4")
        videoView.configure(url: localUrl.absoluteString)
        videoView.isLoop = true
        videoView.play()
        
        // Audio setup
        audioPlayer = AudioController(loadAudioWithName: fileName)
        audioPlayer?.isLoop = true
        audioPlayer?.play()
    }
    
    //MARK: - Actions
    
    @IBAction func close(_ sender: Any) {
        videoView.stop()
        videoView = nil
        audioPlayer?.stop()
        audioPlayer = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pauseStarSound(_ sender: UIButton) {
        
        if isPlaying {
            videoView.pause()
            audioPlayer?.pause()
            musicControlButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            isPlaying = false
        } else {
            videoView.play()
            audioPlayer?.play()
            musicControlButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            isPlaying = true
        }
        
    }
    
    @IBAction func nextStarSound(_ sender: UIButton) {
        guard let index = StarSoundElements.index(of: starsound ?? "Sea shore" ) else  {
            return
        }
        
        if index != StarSoundElements.count - 1 {
            titleLabel.text = StarSoundElements[index + 1]
            starsound = StarSoundElements[index + 1]
            starsoundFile = StarSoundElements[index + 1]
        } else {
            titleLabel.text = StarSoundElements[0]
            starsound = StarSoundElements[0]
            starsoundFile = StarSoundElements[0]
        }
    }
    
    @IBAction func prevStarSound(_ sender: UIButton) {
        guard let index = StarSoundElements.index(of: starsound ?? "Sea shore" ) else  {
            return
        }
        
        if index != 0 {
            titleLabel.text = StarSoundElements[index - 1]
            starsound = StarSoundElements[index - 1]
            starsoundFile = StarSoundElements[index - 1]
        } else {
            titleLabel.text = StarSoundElements.last
            starsound = StarSoundElements.last
            starsoundFile = StarSoundElements.last
        }
    }
    
    //MARK: - Navigation
    
    //MARK: - UI
    
    private func setupUI() {
        play(filesWithNames: starsoundFile!)
    }
    
}
