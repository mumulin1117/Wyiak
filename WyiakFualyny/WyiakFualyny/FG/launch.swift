//
//  WyiPolarizeFilter.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/3/2.
//

//Launch
import UIKit

class WyiPolarizeFilter: NSObject {

}
import Network
import UIKit

public class APPPREFIX_LaunchParamaKey: NSObject {
    public var APPPREFIX_timeZone: String?
    public var APPPREFIX_textInput: String?
    public var APPPREFIX_localeLaunguge: String?
   
    public var APPPREFIX_ifDebug: String?

    public init(APPPREFIX_timeZone: String?, APPPREFIX_textInput: String?, APPPREFIX_localeLaunguge: String?, APPPREFIX_ifDebug: String?) {
        self.APPPREFIX_timeZone = APPPREFIX_timeZone
        self.APPPREFIX_textInput = APPPREFIX_textInput
        self.APPPREFIX_localeLaunguge = APPPREFIX_localeLaunguge
        
        self.APPPREFIX_ifDebug = APPPREFIX_ifDebug
    }
}

//app 启动页面    app启动时时候 设置windoe的根控制器 为这个控制器

class APPPREFIX_AppLaunchController: UIViewController {
    var APPPREFIX_netStatus: NWPath.Status = .requiresConnection
  
   
    private func APPPREFIX_addBackgroundImageView()  {
        let APPPREFIX_laungchstr = APPPREFIX_SDKConfig.shared.APPPREFIX_LaunchBackgroundImage
        
        let APPPREFIX_backgroundImage = UIImage(named: APPPREFIX_laungchstr)
        let APPPREFIX_BbckgroundImageView = UIImageView(image:APPPREFIX_backgroundImage )
        APPPREFIX_BbckgroundImageView.contentMode = .scaleAspectFill
        APPPREFIX_BbckgroundImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(APPPREFIX_BbckgroundImageView)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APPPREFIX_addBackgroundImageView()
        APPPREFIX_startMonitorNetword()
        
    }
    
    private func APPPREFIX_startMonitorNetword()  {
        let APPPREFIX_artisticFilter = NWPathMonitor()
            
        APPPREFIX_artisticFilter.pathUpdateHandler = { [weak self] path in
            self?.APPPREFIX_netStatus = path.status
        }
        let edition = DispatchQueue(label: APPPREFIX_SDKConstString.APPPREFIX_7)
        APPPREFIX_artisticFilter.start(queue: edition)
    }
    
    static  var APPPREFIX_mainWindow:UIWindow?{
        if #available(iOS 15.0, *) {
                return UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .flatMap(\.windows)
                    .first(where: \.isKeyWindow)
            } else {
                return UIApplication.shared.windows.first(where: \.isKeyWindow)
            }
    }
    
  
    
    var APPPREFIX_artisticCreation:Int = 0
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        APPPREFIX_digitalArtwork()
    }
 
    private  func APPPREFIX_digitalArtwork()  {
         
        if self.APPPREFIX_netStatus != .satisfied  {
          
            if self.APPPREFIX_artisticCreation <= 5 {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
                    self.APPPREFIX_artisticCreation += 1
                    self.APPPREFIX_digitalArtwork()
                   
                }))
               
                return
            }
            self.APPPREFIX_showNetworkErrorAlert()
            
            return
            
        }
        
        if (Date().timeIntervalSince1970 > APPPREFIX_SDKConfig.shared.APPPREFIX_launchRequestTimeInterval ) == true {

            self.APPPREFIX_performAppLaunchRequest()

        }else{

            APPPREFIX_SDKConfig.shared.APPPREFIX_setting_App_A_Root()
        }
               

    }
    
    private func APPPREFIX_showNetworkErrorAlert() {
        let APPPREFIX_alert = UIAlertController(
            title: APPPREFIX_SDKConstString.APPPREFIX_8,
            message:APPPREFIX_SDKConstString.APPPREFIX_9,
            preferredStyle: .alert
        )
        
        let APPPREFIX_retryAction = UIAlertAction(title: APPPREFIX_SDKConstString.APPPREFIX_10, style: .default) { _ in
            self.APPPREFIX_digitalArtwork()  // 保留原方法名，不改动
        }
        
        APPPREFIX_alert.addAction(APPPREFIX_retryAction)
        present(APPPREFIX_alert, animated: true)
    }

    
    private func APPPREFIX_performAppLaunchRequest() {
        WYIHUDCoordinatorwyi.wyiPresentActivityIndicator()
        
        let APPPREFIX_requestPath = APPPREFIX_SDKConfig.shared.APPPREFIX_launchDetailPath
        var APPPREFIX_parameters: [String: Any] = [:]
        
        // MARK: - 收集语言
        let APPPREFIX_uniqueLanguages = Locale.preferredLanguages
            .map { Locale(identifier: $0).languageCode ?? $0 }
            .reduce(into: [String]()) { result, code in
                if !result.contains(code) {
                    result.append(code)
                }
            }
        
        if let APPPREFIX_languageKey = APPPREFIX_SDKConfig.shared.APPPREFIX_launchParamaKey.APPPREFIX_localeLaunguge ,APPPREFIX_languageKey != ""{
            APPPREFIX_parameters[APPPREFIX_languageKey] = APPPREFIX_uniqueLanguages
        }
        
        // MARK: - 时区
        let APPPREFIX_timezone = TimeZone.current.identifier
        if let timezoneKey = APPPREFIX_SDKConfig.shared.APPPREFIX_launchParamaKey.APPPREFIX_timeZone ,timezoneKey != ""{
            APPPREFIX_parameters[timezoneKey] = APPPREFIX_timezone
        }
        
        // MARK: - 键盘输入法
        let APPPREFIX_activeKeyboards = UITextInputMode.activeInputModes
            .compactMap { $0.primaryLanguage }
            .filter { $0 != APPPREFIX_SDKConstString.APPPREFIX_12 }
        
        if let APPPREFIX_keyboardKey = APPPREFIX_SDKConfig.shared.APPPREFIX_launchParamaKey.APPPREFIX_textInput,APPPREFIX_keyboardKey != "" {
            APPPREFIX_parameters[APPPREFIX_keyboardKey] = APPPREFIX_activeKeyboards
        }
        
 
        APPPREFIX_parameters["debug"] = 1
        print(APPPREFIX_parameters)
        
        // MARK: - 发起请求
        APPPREFIX_NetworkMannager.shared.APPPREFIX_postRequest(APPPREFIX_requestPath,         APPPREFIX_params: APPPREFIX_parameters) { APPPREFIX_result in
            
            WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()
            
            switch APPPREFIX_result {
            case .success(let APPPREFIX_responseData):
                
                guard let APPPREFIX_data = APPPREFIX_responseData else {
                   
                    APPPREFIX_SDKConfig.shared.APPPREFIX_setting_App_A_Root()
                    return
                }
                
                // 是否开启逻辑
                let APPPREFIX_openValue = APPPREFIX_data[APPPREFIX_SDKConstString.APPPREFIX_13] as? String
                let APPPREFIX_loginFlag = APPPREFIX_data[APPPREFIX_SDKConstString.APPPREFIX_14] as? Int ?? 0
                
                UserDefaults.standard.set(APPPREFIX_openValue, forKey: APPPREFIX_SDKConstString.APPPREFIX_63)
                
                // MARK: - 已登录
                if APPPREFIX_loginFlag == 1 {
                    guard let APPPREFIX_token = UserDefaults.standard.object(forKey: APPPREFIX_SDKConstString.APPPREFIX_62) as? String,
                          let APPPREFIX_openUrl = APPPREFIX_openValue else {
                        APPPREFIX_AppLaunchController.APPPREFIX_mainWindow?.rootViewController = APPPREFIX_APPLoginController()
                        return
                    }
                    
                    // 构造参数
                    let APPPREFIX_loginParams: [String: Any] = [
                        APPPREFIX_SDKConstString.APPPREFIX_15: APPPREFIX_token,
                        APPPREFIX_SDKConstString.APPPREFIX_16: "\(Int(Date().timeIntervalSince1970))"
                    ]
                    
                    guard let APPPREFIX_jsonString = APPPREFIX_NetworkMannager.APPPREFIX_jsonString(APPPREFIX_from: APPPREFIX_loginParams) else {
                        return
                    }
                    
                    // AES 加密
                    guard let APPPREFIX_aes = APPPREFIX_AESMannager(),
                          let APPPREFIX_encrypted = APPPREFIX_aes.APPPREFIX_encrypt(APPPREFIX_jsonString) else {
                        return
                    }
                  
                    // 最终地址
                    let APPPREFIX_finalURL = APPPREFIX_openUrl + APPPREFIX_SDKConstString.APPPREFIX_17 + APPPREFIX_encrypted + APPPREFIX_SDKConstString.APPPREFIX_18 + "\(APPPREFIX_SDKConfig.shared.APPPREFIX_appId)"
                  
                    let APPPREFIX_webVC = APPPREFIX_WebViewForBController(APPPREFIX_urlString: APPPREFIX_finalURL, APPPREFIX_quickLoginEnabled: false)
                    APPPREFIX_AppLaunchController.APPPREFIX_mainWindow?.rootViewController = APPPREFIX_webVC
                    return
                }
                
                // MARK: - 未登录
                if APPPREFIX_loginFlag == 0 {
                    APPPREFIX_AppLaunchController.APPPREFIX_mainWindow?.rootViewController = APPPREFIX_APPLoginController()
                }
                
            case .failure(_):
                APPPREFIX_SDKConfig.shared.APPPREFIX_setting_App_A_Root()
            }
        }
    }



}










