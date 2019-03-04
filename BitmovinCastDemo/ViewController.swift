//
//  VIewControllerViewController.swift
//  BitmovinCastDemo
//
//  Created by Rens Wijnmalen on 04/03/2019.
//  Copyright © 2019 YipYip. All rights reserved.
//

import UIKit
import GoogleCast

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // add cast button
        let castButton = GCKUICastButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        let barButton = UIBarButtonItem(customView: castButton)
        navigationItem.rightBarButtonItem = barButton
        
    }
    

}
