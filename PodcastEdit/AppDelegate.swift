//
//  AppDelegate.swift
//  PodcastEdit
//
//  Created by Илья Егоров on 16.09.2020.
//  Copyright © 2020 Илья Егоров. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
                
        window = UIWindow(frame: UIScreen.main.bounds)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let viewController = storyboard.instantiateInitialViewController() {
//            window?.rootViewController = viewController
//            window?.makeKeyAndVisible()
//        }
        
        let navController = UINavigationController(rootViewController: CreatePodcastViewController())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}

