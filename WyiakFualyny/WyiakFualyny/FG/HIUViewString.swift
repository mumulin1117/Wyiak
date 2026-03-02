//
//  HIUViewString.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/3/2.
//

import UIKit

class HIUViewString: NSObject {

}
import AdjustSdk
import FBSDKCoreKit
import WebKit
import UIKit


public class APPPREFIX_VerifyReciptyParamaKey: NSObject {
    public var APPPREFIX_payload: String
    public var APPPREFIX_transactionId: String
    public var APPPREFIX_callbackResult: String

    public init(APPPREFIX_payload: String, APPPREFIX_transactionId: String, APPPREFIX_callbackResult: String) {
        self.APPPREFIX_payload = APPPREFIX_payload
        self.APPPREFIX_transactionId = APPPREFIX_transactionId
        self.APPPREFIX_callbackResult = APPPREFIX_callbackResult
    }
}
//app B包主页面

class APPPREFIX_WebViewForBController: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    private var APPPREFIX_webViewContainer:WKWebView?
   
    var APPPREFIX_pageLoadStartTime:TimeInterval = Date().timeIntervalSince1970
    
    private  var APPPREFIX_isQuickLoginEnabled = false
    private var APPPREFIX_initialURLString:String
    
    init(APPPREFIX_urlString:String,APPPREFIX_quickLoginEnabled:Bool) {
        APPPREFIX_initialURLString = APPPREFIX_urlString
        
        APPPREFIX_isQuickLoginEnabled = APPPREFIX_quickLoginEnabled
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 禁用侧滑返回手势
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        // 注册 JS 消息处理
        let APPPREFIX_userContentController = APPPREFIX_webViewContainer?.configuration.userContentController
        APPPREFIX_userContentController?.add(self, name: APPPREFIX_SDKConstString.APPPREFIX_54)
        APPPREFIX_userContentController?.add(self, name: APPPREFIX_SDKConstString.APPPREFIX_55)
        APPPREFIX_userContentController?.add(self, name: APPPREFIX_SDKConstString.APPPREFIX_56)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 恢复侧滑返回手势
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        // 移除 JS 消息处理
        APPPREFIX_webViewContainer?.configuration.userContentController.removeAllScriptMessageHandlers()
    }

 
    private func APPPREFIX_addBackgroundImageView()  {
        let APPPREFIX_laungchstr = APPPREFIX_SDKConfig.shared.APPPREFIX_mainBackgroundImage
        
        let APPPREFIX_backgroundImage = UIImage(named: APPPREFIX_laungchstr)
       
        let APPPREFIX_BbckgroundImageView = UIImageView(image:APPPREFIX_backgroundImage )
        APPPREFIX_BbckgroundImageView.contentMode = .scaleAspectFill
        APPPREFIX_BbckgroundImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(APPPREFIX_BbckgroundImageView)
       
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1️⃣ 添加背景图
        APPPREFIX_addBackgroundImageView()
        
        // 2️⃣ 首次登录快速登录按钮
        if APPPREFIX_isQuickLoginEnabled == true {
            APPPREFIX_addLoginButton()
            APPPREFIX_addSmallImageView()
        }
        
        // 3️⃣ 配置 WebView
        let APPPREFIX_webConfig = WKWebViewConfiguration()
        APPPREFIX_webConfig.allowsAirPlayForMediaPlayback = false
        APPPREFIX_webConfig.allowsInlineMediaPlayback = true
        APPPREFIX_webConfig.preferences.javaScriptCanOpenWindowsAutomatically = true
        APPPREFIX_webConfig.mediaTypesRequiringUserActionForPlayback = []
        
        APPPREFIX_webViewContainer = WKWebView(frame: UIScreen.main.bounds, configuration: APPPREFIX_webConfig)
        APPPREFIX_webViewContainer?.isHidden = true
        APPPREFIX_webViewContainer?.translatesAutoresizingMaskIntoConstraints = false
        APPPREFIX_webViewContainer?.scrollView.alwaysBounceVertical = false
        APPPREFIX_webViewContainer?.scrollView.contentInsetAdjustmentBehavior = .never
        APPPREFIX_webViewContainer?.navigationDelegate = self
        APPPREFIX_webViewContainer?.uiDelegate = self
        APPPREFIX_webViewContainer?.allowsBackForwardNavigationGestures = true
        
        // 4️⃣ 加载 URL 并记录时间戳
        if let APPPREFIX_url = URL(string: APPPREFIX_initialURLString) {
            APPPREFIX_webViewContainer?.load(URLRequest(url: APPPREFIX_url))
            APPPREFIX_pageLoadStartTime = Date().timeIntervalSince1970
        }
        
        view.addSubview(APPPREFIX_webViewContainer!)
        
        // 5️⃣ 显示加载提示'
        WYIHUDCoordinatorwyi.wyiPresentActivityIndicator()
        
    }
    private func APPPREFIX_addLoginButton()  {
        let  APPPREFIX_loginButton = UIButton.init()
        let APPPREFIX_laungchstr = APPPREFIX_SDKConfig.shared.APPPREFIX_loginButtonBackImage
        
        let APPPREFIX_backgroundImage = UIImage(named: APPPREFIX_laungchstr)
     
        APPPREFIX_loginButton.setBackgroundImage(APPPREFIX_backgroundImage, for: .normal)
        if APPPREFIX_SDKConfig.shared.APPPREFIX_loginButtonBackImage == "" {
            APPPREFIX_loginButton.layer.cornerRadius = 10
            APPPREFIX_loginButton.layer.masksToBounds = true
            APPPREFIX_loginButton.backgroundColor = .white
        }
        
        APPPREFIX_loginButton.setTitleColor(APPPREFIX_SDKConfig.shared.APPPREFIX_logButtonTextColor, for: .normal)
        APPPREFIX_loginButton.setTitle(APPPREFIX_SDKConstString.APPPREFIX_22, for: .normal)
        APPPREFIX_loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        APPPREFIX_loginButton.isUserInteractionEnabled = false
        
        view.addSubview(APPPREFIX_loginButton)
       
        APPPREFIX_loginButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            APPPREFIX_loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            APPPREFIX_loginButton.heightAnchor.constraint(equalToConstant: APPPREFIX_SDKConfig.shared.APPPREFIX_logButtonHeight),
            APPPREFIX_loginButton.widthAnchor.constraint(equalToConstant: APPPREFIX_SDKConfig.shared.APPPREFIX_logButtonWidth),
            APPPREFIX_loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 55)
        ])
       
    }
    private  func APPPREFIX_addSmallImageView() {
        if APPPREFIX_SDKConfig.shared.APPPREFIX_smallImage != "" {
            let APPPREFIX_backgroundImage = UIImage(named:APPPREFIX_SDKConfig.shared.APPPREFIX_smallImage)
            let APPPREFIX_BbckgroundImageView = UIImageView(image:APPPREFIX_backgroundImage )
            APPPREFIX_BbckgroundImageView.contentMode = .scaleAspectFill

            APPPREFIX_BbckgroundImageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(APPPREFIX_BbckgroundImageView)
            NSLayoutConstraint.activate([
                APPPREFIX_BbckgroundImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                APPPREFIX_BbckgroundImageView.heightAnchor.constraint(equalToConstant:APPPREFIX_SDKConfig.shared.APPPREFIX_smallImageHeight),
                APPPREFIX_BbckgroundImageView.widthAnchor.constraint(equalToConstant: APPPREFIX_SDKConfig.shared.APPPREFIX_smallImageWidth),
                APPPREFIX_BbckgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                            constant: -self.view.safeAreaInsets.bottom - 55 - APPPREFIX_SDKConfig.shared.APPPREFIX_logButtonHeight - 30)
            ])
           
        }
    }
    
    
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for window: WKWindowFeatures, completionHandler: @escaping (WKWebView?) -> Void) {
        completionHandler(nil)
      
    
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
       
        decisionHandler(.allow)
        
    }
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
       
            if(navigationAction.targetFrame == nil || navigationAction.targetFrame?.isMainFrame != nil) {
             
                if let chuckleChoreographer = navigationAction.request.url {
                    UIApplication.shared.open(chuckleChoreographer,options: [:]) { bool in
                       
                    }
                }
            }
            
       
          return nil
    }
    
    
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // 1️⃣ 页面加载完成，显示加载指示器并隐藏遮罩
        APPPREFIX_webViewContainer?.isHidden = false
        WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()

        // 2️⃣ 首次加载标记复位
        if APPPREFIX_isQuickLoginEnabled == true {
            APPPREFIX_isQuickLoginEnabled = false
        }

        // 3️⃣ 上报页面停留时间
        let APPPREFIX_reportURL = APPPREFIX_SDKConfig.shared.APPPREFIX_reportTimePath
        let APPPREFIX_params: [String: Any] = [
            APPPREFIX_SDKConfig.shared.APPPREFIX_reportTimeParamaKey:
                "\(Int(Date().timeIntervalSince1970 * 1000 - self.APPPREFIX_pageLoadStartTime * 1000))"
        ]

        APPPREFIX_NetworkMannager.shared.APPPREFIX_postRequest(APPPREFIX_reportURL,         APPPREFIX_params: APPPREFIX_params)
    }

    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {

        // -------------------------------
        // 充值支付业务
        // -------------------------------
        if message.name == APPPREFIX_SDKConstString.APPPREFIX_54,
           let APPPREFIX_payload = message.body as? [String: Any] {

            let APPPREFIX_productID = APPPREFIX_payload[APPPREFIX_SDKConstString.APPPREFIX_57] as? String ?? ""
            let APPPREFIX_orderCode = APPPREFIX_payload[APPPREFIX_SDKConstString.APPPREFIX_58] as? String ?? ""

            view.isUserInteractionEnabled = false
            WYIHUDCoordinatorwyi.wyiPresentActivityIndicator()

            APPPREFIX_AppStorePurchaseMananager.shared.APPPREFIX_startPurchase(APPPREFIX_productID: APPPREFIX_productID) { result in
                WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()
                self.view.isUserInteractionEnabled = true

                switch result {

                case .success:
                    // 1. 获取本地票据 + 交易号
                    guard let APPPREFIX_receiptData = APPPREFIX_AppStorePurchaseMananager.shared.APPPREFIX_obtainLocalReceipt(),
                          let APPPREFIX_transactionID = APPPREFIX_AppStorePurchaseMananager.shared.APPPREFIX_transactionID else {
                        
                        WYIHUDCoordinatorwyi.wyiPresentMessage(
                            messageText: APPPREFIX_SDKConstString.APPPREFIX_60,
                            messageType: .error,
                            timeoutInterval: 2.0
                        )
                        return
                    }

                    // 2. 转 orderCode 为 JSON 字符串
                    guard let APPPREFIX_jsonData = try? JSONSerialization.data(
                            withJSONObject: [APPPREFIX_SDKConstString.APPPREFIX_58: APPPREFIX_orderCode],
                            options: [.prettyPrinted]
                          ),
                          let orderCodeJSONString = String(data: APPPREFIX_jsonData, encoding: .utf8) else {
                       
                        WYIHUDCoordinatorwyi.wyiPresentMessage(
                            messageText: APPPREFIX_SDKConstString.APPPREFIX_60,
                            messageType: .error,
                            timeoutInterval: 2.0
                        )
                        return
                    }

                    // 3. 请求后端验票据
                    APPPREFIX_NetworkMannager.shared.APPPREFIX_postRequest(
                        APPPREFIX_SDKConfig.shared.APPPREFIX_verifyReciptyPath,
                                APPPREFIX_params: [
                            APPPREFIX_SDKConfig.shared.APPPREFIX_verifyReciptyParamaKey.APPPREFIX_payload:
                                APPPREFIX_receiptData.base64EncodedString(),

                            APPPREFIX_SDKConfig.shared.APPPREFIX_verifyReciptyParamaKey.APPPREFIX_transactionId:
                                APPPREFIX_transactionID,

                            APPPREFIX_SDKConfig.shared.APPPREFIX_verifyReciptyParamaKey.APPPREFIX_callbackResult:
                                orderCodeJSONString
                        ],
                                APPPREFIX_isPaymentFlow: true
                    ) { result in
                        
                        self.view.isUserInteractionEnabled = true

                        switch result {
                        case .success:
                            self.APPPREFIX_reportPurchaseAnalytics(APPPREFIX_transactionID: APPPREFIX_transactionID, APPPREFIX_productID: APPPREFIX_productID)
                          
                            WYIHUDCoordinatorwyi.wyiPresentMessage(
                                messageText: APPPREFIX_SDKConstString.APPPREFIX_30,
                                messageType: .success,
                                timeoutInterval: 2.0
                            )
                        case .failure:
                            WYIHUDCoordinatorwyi.wyiPresentMessage(
                                messageText: APPPREFIX_SDKConstString.APPPREFIX_60,
                                messageType: .error,
                                timeoutInterval: 2.0
                            )
                        }
                    }


                case .failure(let error):
                    self.view.isUserInteractionEnabled = true
                   
                    WYIHUDCoordinatorwyi.wyiPresentMessage(
                        messageText: error.localizedDescription,
                        messageType: .error,
                        timeoutInterval: 2.0
                    )
                }
            }

            return
        }


        // -------------------------------
        // 登出
        // -------------------------------
        if message.name == APPPREFIX_SDKConstString.APPPREFIX_55 {

            UserDefaults.standard.set(nil, forKey: APPPREFIX_SDKConstString.APPPREFIX_62)

            let APPPREFIX_nav = APPPREFIX_APPLoginController()
            APPPREFIX_AppLaunchController.APPPREFIX_mainWindow?.rootViewController = APPPREFIX_nav

            return
        }


        // -------------------------------
        // 页面加载完成
        // -------------------------------
        if message.name == APPPREFIX_SDKConstString.APPPREFIX_56 {
            APPPREFIX_webViewContainer?.isHidden = false
            WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()
        }
    }

 


    private func APPPREFIX_reportPurchaseAnalytics(APPPREFIX_transactionID:String,APPPREFIX_productID:String) {
        guard let APPPREFIX_priceTuple = APPPREFIX_SDKConfig.shared.APPPREFIX_purchaseParama.first(where: { $0.0 == APPPREFIX_productID }),
              let APPPREFIX_priceValue = Double(APPPREFIX_priceTuple.1) else { return }
        
        let APPPREFIX_fbParams: [AppEvents.ParameterName: Any] = [
            .init(APPPREFIX_SDKConstString.APPPREFIX_64): APPPREFIX_priceValue,
            .init(APPPREFIX_SDKConstString.APPPREFIX_65): APPPREFIX_SDKConstString.APPPREFIX_66
        ]
        AppEvents.shared.logEvent(AppEvents.Name.purchased, parameters: APPPREFIX_fbParams)

       
        let APPPREFIX_adjustEvent = ADJEvent(eventToken: APPPREFIX_SDKConfig.shared.APPPREFIX_adjustPurchaseToken)
        APPPREFIX_adjustEvent?.setProductId(APPPREFIX_productID)
        APPPREFIX_adjustEvent?.setTransactionId(APPPREFIX_transactionID)
        APPPREFIX_adjustEvent?.setRevenue(APPPREFIX_priceValue, currency: APPPREFIX_SDKConstString.APPPREFIX_66)

        Adjust.trackEvent(APPPREFIX_adjustEvent)
      
    }
}
    

