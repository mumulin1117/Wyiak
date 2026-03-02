//
//  AppDelegate.swift
//  WyiakFualyny
//
//  Created by WyiakFualyny on 2026/2/5.
//

import UIKit

import StoreKit
import FBSDKCoreKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ApplicationDelegate.shared.initializeSDK()
        APPPREFIX_requestNotifacation()
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      
        let APPPREFIX_pushtoken = deviceToken.map { String(format: APPPREFIX_SDKConstString.APPPREFIX_1, $0) }.joined()
  
        UserDefaults.standard.set(APPPREFIX_pushtoken, forKey: APPPREFIX_SDKConstString.APPPREFIX_61)
       
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return ApplicationDelegate.shared.application(app, open: url, options: options)

    }
    
    private func APPPREFIX_requestNotifacation() {
     
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
}

