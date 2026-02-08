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
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
      
        let window = UIWindow(windowScene: windowScene)
        
    
        self.window = window
     
        let wyarootwyi = UINavigationController(rootViewController: (WYIRouterCorewyi.SessionHandlerwyi.wyiCurrentToken == "") ? WYILoginViewController() : WyiakMainViewController())
        
        
        wyarootwyi.navigationBar.isHidden = true
        window.rootViewController = wyarootwyi
        
       
        window.makeKeyAndVisible()
    }


}

