//
//  AppDelegate.swift
//  BitmovinCastDemo
//
//  Created by Rens Wijnmalen on 04/03/2019.
//  Copyright © 2019 YipYip. All rights reserved.
//

import UIKit
import BitmovinPlayer
import GoogleCast

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let _debugLoggingEnabled:Bool = true

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        BitmovinCastManager.initializeCasting()
//        BitmovinCastManager.initializeCasting(applicationId: "36854B2A", messageNamespace: nil) // Published google cast app of type "Styled Media Receiver"
        BitmovinCastManager.initializeCasting(applicationId: kGCKDefaultMediaReceiverApplicationID, messageNamespace: nil) // Googles default app of type "Styled Media Receiver" (https://developers.google.com/cast/docs/caf_receiver/)
        
        // Initialize logging
        GCKLogger.sharedInstance().delegate = self
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension AppDelegate: GCKLoggerDelegate {
    public func log(fromFunction function: UnsafePointer<Int8>, message: String) {
        print("ChromeCast Log: \(function) \(message)")
    }
    
    func logMessage(_ message: String, at level: GCKLoggerLevel, fromFunction function: String, location: String) {
        if (self._debugLoggingEnabled) {
            print(function + " - " + message)
        }
    }
}
