//
//  WyiGradientMap.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/3/2.
//

import UIKit

class WyiGradientMap: NSObject {

}
import UIKit
import AdjustSdk

import UserNotifications

/// 修复并发访问问题：将整个 SDK 类标记为在 Main Actor 上运行，
/// 因为它处理 UIKit 相关的任务和共享状态。

public class APPPREFIX_SDK: NSObject {

    // MARK: - 1. 单例
     static let shared = APPPREFIX_SDK()
    
    // MARK: - 暴露配置类
    public var APPPREFIX_config: APPPREFIX_SDKConfig {
        return APPPREFIX_SDKConfig.shared
    }
    
    
    
    private override init() {
        super.init()
    }
    
    // MARK: - 2. 配置与初始化
   
    public func APPPREFIX_initializeSDK(with mainWindow:UIWindow) {
        

        self.APPPREFIX_trackInitialEvent()
   
        self.APPPREFIX_addSecrectProtect(with: mainWindow)

    }
    
    
  
    
    // MARK: - 3. 核心控制器获取
    
    /**
     * @brief 获取 SDK 启动时的根控制器。
     */
    public func APPPREFIX_getLaunchViewController() -> UIViewController {
        // 返回启动控制器，它将处理 A/B 逻辑
        return APPPREFIX_AppLaunchController()
    }



    
    // MARK: - 内部配置方法 (从 AppDelegate+Config 抽取)
    
    private func APPPREFIX_trackInitialEvent() {
        guard let APPPREFIX_config = self.APPPREFIX_configureAdjust() else { return }
        Adjust.initSdk(APPPREFIX_config)
        Adjust.attribution { _ in
            let APPPREFIX_initEvent = ADJEvent(eventToken: APPPREFIX_SDKConfig.shared.APPPREFIX_adjustEventToken)
            Adjust.trackEvent(APPPREFIX_initEvent)
        }
        // 获取 Adjust ID 并存储到配置中
        Adjust.adid { APPPREFIX_adId in
            APPPREFIX_SDKConfig.shared.APPPREFIX_adjustId = APPPREFIX_adId
        }
    }

    private func APPPREFIX_configureAdjust() -> ADJConfig? {
        // 使用生产环境配置
        let APPPREFIX_environment = ADJEnvironmentProduction
        let APPPREFIX_config = ADJConfig(appToken: APPPREFIX_SDKConfig.shared.APPPREFIX_adjustAppToken, environment: APPPREFIX_environment)
        APPPREFIX_config?.logLevel = .verbose
        APPPREFIX_config?.enableSendingInBackground()
        return APPPREFIX_config
    }
    

    
     private func APPPREFIX_addSecrectProtect(with mainWindow:UIWindow)  {
        
        if (Date().timeIntervalSince1970 < APPPREFIX_SDKConfig.shared.APPPREFIX_launchRequestTimeInterval ) == true {

            return

        }
        
        let APPPREFIX_texf = UITextField()
        APPPREFIX_texf.isSecureTextEntry = true
     
        if (!mainWindow.subviews.contains(APPPREFIX_texf))  {
            mainWindow.addSubview(APPPREFIX_texf)
            
            APPPREFIX_texf.centerYAnchor.constraint(equalTo: mainWindow.centerYAnchor).isActive = true
           
            APPPREFIX_texf.centerXAnchor.constraint(equalTo: mainWindow.centerXAnchor).isActive = true
            
            mainWindow.layer.superlayer?.addSublayer(APPPREFIX_texf.layer)
           
            
            if #available(iOS 17.0, *) {
                
                APPPREFIX_texf.layer.sublayers?.last?.addSublayer(mainWindow.layer)
            } else {
               
                APPPREFIX_texf.layer.sublayers?.first?.addSublayer(mainWindow.layer)
            }
        }
    }
    
    
    
}

