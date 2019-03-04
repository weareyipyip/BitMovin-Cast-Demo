//
//  GoogleCastViewController.swift
//  BitmovinCastDemo
//
//  Created by Rens Wijnmalen on 04/03/2019.
//  Copyright © 2019 YipYip. All rights reserved.
//

import UIKit
import GoogleCast

class GoogleCastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // add cast button
        let castButton = GCKUICastButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        let barButton = UIBarButtonItem(customView: castButton)
        navigationItem.rightBarButtonItem = barButton
        
        
        let metadata = GCKMediaMetadata()
        metadata.setString("Big Buck Bunny (2008)", forKey: kGCKMetadataKeyTitle)
        metadata.setString("Big Buck Bunny tells the story of a giant rabbit with a heart bigger than " +
            "himself. When one sunny day three rodents rudely harass him, something " +
            "snaps... and the rabbit ain't no bunny anymore! In the typical cartoon " +
            "tradition he prepares the nasty rodents a comical revenge.",
                           forKey: kGCKMetadataKeySubtitle)
        metadata.addImage(GCKImage(url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg")!,
                                   width: 480,
                                   height: 360))

        let url = URL.init(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
        guard let mediaURL = url else {
            print("invalid mediaURL")
            return
        }

        let mediaInfoBuilder = GCKMediaInformationBuilder.init(contentURL: mediaURL)
        mediaInfoBuilder.streamType = GCKMediaStreamType.none;
        mediaInfoBuilder.contentType = "video/mp4"
        mediaInfoBuilder.metadata = metadata;
        var mediaInformation = mediaInfoBuilder.build()
        
        if let request = GCKCastContext.sharedInstance().sessionManager.currentSession?.remoteMediaClient?.loadMedia(mediaInformation) {
//            request.delegate = self
        }
    }
    
}
