//
//  AppDelegate.swift
//  speedlimit
//
//  Created by Alexander Kytmanov on 11/22/19.
//  Copyright © 2019 Alexander Kytmanov. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print("didDiscardSceneSessions")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        application.isIdleTimerDisabled = true
        print("App state: \(application.applicationState). IdleTimer: \(application.isIdleTimerDisabled)")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        application.isIdleTimerDisabled = false
        print("App state: \(application.applicationState). IdleTimer: \(application.isIdleTimerDisabled)")
        
    }
    
}

