//
//  AppDelegate.swift
//  interviewDemo
//
//  Created by wang fei on 2020/9/24.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        let view = HomeViewController()
        let navigation = UINavigationController(rootViewController: view)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible();
        // Override point for customization after application launch.
        return true
    }


}

