//
//  SDKConfig.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/3/2.
//

import UIKit

class SDKConfig: NSObject {

}
public class APPPREFIX_SDKConfig: NSObject {
    
    // MARK: - 1. 单例
    public static let shared = APPPREFIX_SDKConfig()
    
    // 私有初始化方法，强制使用单例
    internal override init() {
        super.init()
    }
    
    // MARK: - 2. 环境控制与 Window
    
    /**
     * @brief 是否是测试环境。设置为 true 时，只读属性 (baseURL, aesKey, appId, aesIV) 将使用 Debug 配置。
     */
    public var APPPREFIX_debugMode: Bool = true
    
   
    
    // MARK: - 3. 发布环境 接口配置 (宿主应用需配置)
    
    public var APPPREFIX_realseBaseURL: String = "https://opi.7dqsmr2s.link"//base url ****
    public var APPPREFIX_realseAPPID: String = "60420695"//APPID ****
    public var APPPREFIX_realseAesKey: String = "dgyc22zv6g21oxzw"//AES加密key ****
    public var APPPREFIX_realseAesIV: String = "qkewwqiwn1sqdx9v"//AES加密IV ****
    
    // MARK: - 4. A/B 切换和 Adjust 配置
    
    /**
     * @brief 启动页网络请求时间控制（Unix Time Interval）。早于此时间，LaunchController 将直接进入 A 面。
     */
    public var APPPREFIX_launchRequestTimeInterval: TimeInterval = 0 //****
    
    /**
     * @brief Adjust ID，由 SDK 内部获取 Adjust.adid 并存储到 UserDefaults (遵循您的现有逻辑)。
     */
    public var APPPREFIX_adjustId: String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "APPAdjustId")//这里的key每个app需要改 ***
        }get{
            return UserDefaults.standard.object(forKey: "APPAdjustId") as? String
        }
    }
    
    // MARK: - FB Adjust 配置 (宿主应用需配置)
    public var APPPREFIX_adjustAppToken: String = "3p89igfb2ybk" // AppToken ***
    public var APPPREFIX_adjustEventToken: String = "lm8gr1" // EventToken ***
    public var APPPREFIX_adjustPurchaseToken: String = "gly7w9" // PurchaseToken ***
    
    // MARK: - 5. UI 配置 (宿主应用需配置)
    
    public var APPPREFIX_LaunchBackgroundImage: String = "WyiakLainu"//启动页面背景图 ****
    public var APPPREFIX_mainBackgroundImage: String = "wyiKiua"//登录和web页面背景图 ****
    public var APPPREFIX_loginButtonBackImage: String = "YESINOD" //登录按钮背景 ****
    public var APPPREFIX_smallImage: String = "" //登录页如果有小图 ****
    
    public var APPPREFIX_logButtonWidth: CGFloat = 342//登录按钮宽 ****
    public var APPPREFIX_logButtonHeight: CGFloat = 68//登录按钮高 ****
    public var APPPREFIX_logButtonTextColor: UIColor = .clear//登录按钮字体颜色 ****
    public var APPPREFIX_smallImageWidth: CGFloat = 0//登录页面 小图片 宽
    public var APPPREFIX_smallImageHeight: CGFloat = 0//登录页面 小图片 高
    
    // MARK: - 6. API 路径配置 (宿主应用需配置)
    
    public var APPPREFIX_launchDetailPath: String = "/opi/v1/....o"//启动接口 ****
    public var APPPREFIX_loginPath: String = "/opi/v1/....l"//登录 ****
    public var APPPREFIX_reportTimePath: String = "/opi/v1/....t"//web加载时间统计 ****
    public var APPPREFIX_verifyReciptyPath: String = "/opi/v1/....p"//验单 ****
    
    // MARK: - 7. API 参数 Key 配置 (宿主应用需配置)
    
    public var APPPREFIX_launchParamaKey: APPPREFIX_LaunchParamaKey = APPPREFIX_LaunchParamaKey(
        APPPREFIX_timeZone: "....t",//时区
        APPPREFIX_textInput: "....k",//键盘
        APPPREFIX_localeLaunguge: "...e",//语言
       
        APPPREFIX_ifDebug: "....g"//是否调试
    )
    
    public var APPPREFIX_loginParamaKey: APPPREFIX_LoginParamaKey = APPPREFIX_LoginParamaKey(
        APPPREFIX_deviceID: "....n",//deviceIDkey ****
        APPPREFIX_adjustID: "....a",//adjustIDkey ****
        APPPREFIX_passwordKey: "....d"//passwordkey ****
    )
    
    public var APPPREFIX_reportTimeParamaKey: String = "....o"//时间差key ****
    
    public var APPPREFIX_verifyReciptyParamaKey: APPPREFIX_VerifyReciptyParamaKey = APPPREFIX_VerifyReciptyParamaKey(
        APPPREFIX_payload: "....p",//payloadkey ****
        APPPREFIX_transactionId: "....t",//transactionIdkey ****
        APPPREFIX_callbackResult: "....c"//callbackResultkey ****
    )

    
    // MARK: - 9. 支付配置 (宿主应用需配置)
    
    public var APPPREFIX_purchaseParama: [String: String] = ["a": "0.99", "b": "1.99", "c": "4.99"] //***
    
    // MARK: - 10. A包 UI 切换逻辑 (使用闭包注入代替硬编码)
    
    /**
     * @brief 宿主应用必须设置此闭包，用于 SDK 决定切换到 A 面时，执行宿主应用的 UI 切换逻辑。
     * @discussion 宿主应用的 AppDelegate 必须将切换逻辑注入到此 Handler 中。
     * @param window 宿主应用的 UIWindow。
     */
    public var APPPREFIX_setting_App_A_Root_Handler: ((UIWindow?) -> Void)?
    
    /**
     * @brief 内部调用方法，触发宿主应用配置的 A 包切换逻辑。
     * @discussion SDK 内部调用此方法来执行 A 包切换。
     */
    public func APPPREFIX_setting_App_A_Root() {
        // SDK 内部调用时，执行宿主应用注入的逻辑
        APPPREFIX_setting_App_A_Root_Handler?(APPPREFIX_AppLaunchController.APPPREFIX_mainWindow)
    }
    
    // MARK: - 11. 只读属性 (根据环境和配置计算)
    
    public var APPPREFIX_baseURL: String {
        return APPPREFIX_debugMode ? "https://opi.cphub.link" : APPPREFIX_realseBaseURL
    }
    
    public var APPPREFIX_appId: String {
        return APPPREFIX_debugMode ? "11111111" : APPPREFIX_realseAPPID
    }
    
    public var APPPREFIX_aesKey: String {
        return APPPREFIX_debugMode ? "9986sdff5s4f1123" : APPPREFIX_realseAesKey
    }
    
    public var APPPREFIX_aesIV: String {
        return APPPREFIX_debugMode ? "9986sdff5s4y456a" : APPPREFIX_realseAesIV
    }
}
