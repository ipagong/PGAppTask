//
//  AppDelegate.swift
//  PGAppTask
//
//  Created by ipagong on 04/26/2021.
//  Copyright (c) 2021 ipagong. All rights reserved.
//

import UIKit
import PGAppTask

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return AppTaskHandler.didFinishLaunchingWithOptions(launchOptions)
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) {
        AppTaskHandler.destroy()
    }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) {
        AppTaskHandler.initialize()
    }

    func applicationWillTerminate(_ application: UIApplication) { }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        AppTaskQueue.shared.push(.scheme, options: options, object: url)
        AppTaskQueue.shared.start(delay: 0.3)
        return true
    }
}

