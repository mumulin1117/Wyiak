//
//  SceneDelegate.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/5.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

       
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 1. 确保场景是 UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 2. 创建窗口
        let window = UIWindow(windowScene: windowScene)
        
        // 3. 实例化你的主控制器
        // 如果你的 MainTabBarController 是在 Storyboard 中定义的，请使用 storyboard.instantiateInitialViewController()
        let mainVC = WyiakMainViewController()//WYILoginViewController()//
        
        // 4. 设置根控制器并显示
        window.rootViewController = mainVC
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
     
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
     
    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }


}

