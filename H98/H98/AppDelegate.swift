//
//  AppDelegate.swift
//  H98
//
//  Created by Jany on 17/9/22.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,BMKGeneralDelegate {

    var window: UIWindow?
    lazy var bmkManager:BMKMapManager = BMKMapManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        prepareSecondeData()
        
        window = UIWindow()
        window?.backgroundColor = UIColor.black
        let vc = NSClassFromString(Bundle.main.namespace() + "." + "LYLoginViewController") as! UIViewController.Type
        window?.rootViewController = vc.init()
        window?.makeKeyAndVisible()
        return true

    }
}

extension AppDelegate{
    
    //MARK: 项目前第三方的一些准备
    fileprivate func prepareSecondeData() -> Void {
        
        GMSServices.provideAPIKey("AIzaSyA6XKDkTQRxIai4mmQz8_O586blUoUiwps")
        bmkManager.start("wac8GajEAYjnSddMue9B5M95dhOrV19z", generalDelegate: self)
    }
}
