//
//  AppDelegate.swift
//  H98
//
//  Created by Jany on 17/9/22.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.backgroundColor = UIColor.black
        let vc = NSClassFromString(Bundle.main.namespace() + "." + "LYDeviceInforViewController") as! UIViewController.Type
        window?.rootViewController = vc.init()
        window?.makeKeyAndVisible()
        return true

    }
}

