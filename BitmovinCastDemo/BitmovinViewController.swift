//
//  ViewController.swift
//  BitmovinCastDemo
//
//  Created by Rens Wijnmalen on 04/03/2019.
//  Copyright © 2019 YipYip. All rights reserved.
//

import UIKit
import BitmovinPlayer
import GoogleCast

class BitmovinViewController: UIViewController {

    var player: BitmovinPlayer?
    
    deinit {
        player?.destroy()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        // add cast button
        let castButton = GCKUICastButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        let barButton = UIBarButtonItem(customView: castButton)
        navigationItem.rightBarButtonItem = barButton
        
        // Define needed resources
        guard let streamUrl = URL(string: "https://bitmovin-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"),
            let posterUrl = URL(string: "https://bitmovin-a.akamaihd.net/content/MI201109210084_1/poster.jpg") else {
                return
        }
        
        // Create player configuration
        let config = PlayerConfiguration()
        
        do {
            try config.setSourceItem(url: streamUrl)
            // Set title and poster image
            config.sourceItem?.itemTitle = "Demo Stream"
            config.sourceItem?.posterSource = posterUrl
            
            // Create player based on player configuration
            let player = BitmovinPlayer(configuration: config)
            
            // Create player view and pass the player instance to it
            let playerView = BMPBitmovinPlayerView(player: player, frame: .zero)
            
            // Listen to player events
            player.add(listener: self)
            
            playerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            playerView.frame = view.bounds
            
            view.addSubview(playerView)
            view.bringSubviewToFront(playerView)
            
            self.player = player
        } catch {
            print("Configuration error: \(error)")
        }
        
    }

}

extension BitmovinViewController: PlayerListener {
    
    func onPlay(_ event: PlayEvent) {
        print("onPlay \(event.time)")
    }
    
    func onPaused(_ event: PausedEvent) {
        print("onPaused \(event.time)")
    }
    
    func onTimeChanged(_ event: TimeChangedEvent) {
        print("onTimeChanged \(event.currentTime)")
    }
    
    func onDurationChanged(_ event: DurationChangedEvent) {
        print("onDurationChanged \(event.duration)")
    }
    
    func onError(_ event: ErrorEvent) {
        print("onError \(event.message)")
    }
}


