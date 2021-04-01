//
//  AppDelegate.swift
//  interviewDemo
//
//  Created by Mackellen on 2020/9/24.
//  Copyright © 2020 mackellen. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        realmUpgraded()
        
        let view = HomeViewController()
        let navigation = UINavigationController(rootViewController: view)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible();
        // Override point for customization after application launch.
        return true
    }
    
    func realmUpgraded() {
        let config = Realm.Configuration(
             schemaVersion: 1,
             migrationBlock: { migration, oldSchemaVersion in
                     if (oldSchemaVersion < 1) {}
             })
        Realm.Configuration.defaultConfiguration = config
    }
}

