//
//  AppDelegate.swift
//  Calculator
//
//  Created by doczy on 9/15/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let home = HomeVC(nibName: "HomeVC", bundle: nil)
        let calculator = CalculatorVC(nibName: "CalculatorVC", bundle: nil)
        let table = TableVC(nibName: "TableVC", bundle: nil)
        let collection = CollectionVC(nibName: "CollectionVC", bundle: nil)
        let data = DataVC(nibName: "DataVC", bundle: nil)
        let nav = UINavigationController()
        nav.viewControllers = [home]
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

