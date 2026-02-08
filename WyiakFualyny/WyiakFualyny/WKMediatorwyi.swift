//
//  WKMediatorwyi.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/8.
//

import UIKit
import WebKit
import StoreKit
class WKMediatorwyi: UIViewController, WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate, SKPaymentTransactionObserver, SKProductsRequestDelegate {
  
    private var wyiTransitionFlag: Bool = false
    private var wyiAuthTokenCache: String?
    private var wyiSessionIdentifier: UUID?
    private var wyiBackgroundTaskId: UIBackgroundTaskIdentifier?
    private var wyiNavigationStackDepth: Int = 0
    private var wyiLastInteractionTime: Date?
    private var wyiConfigurationVersion: Int = 1
    private var wyiFeatureFlags: [String: Bool] = [:]
    
   
    private var wyiActiveProductIdentifier: String?
    
 
    private var wyiIntermediateResultBuffer: String?
    private var wyiTemporaryStorageArray: [Any] = []
    private var wyiConditionalExecutionFlag = true
    
    private lazy var wyiActivityLoader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView.init(style: .large)
      
        let calculatedSize = self.wyiCalculateLoaderDimensions()
        loader.frame.size = calculatedSize
        loader.tintColor = self.wyiDetermineLoaderColor()
        loader.hidesWhenStopped = true
        loader.color = self.wyiDetermineLoaderColor()
        
      
        self.wyiPerformRedundantSetup(for: loader)
        return loader
    }()
   
    private var wyiManifestSource: String
    private var wyiManifestCache: String?
    
    init(entryPointwyi: String) {
      
        if entryPointwyi.isEmpty {
            self.wyiManifestSource = ""
        } else {
            self.wyiManifestSource = entryPointwyi
        }
    
        self.wyiSessionIdentifier = UUID()
        self.wyiLastInteractionTime = Date()
        
        super.init(nibName: nil, bundle: nil)
      
        self.wyiInitializePaymentObserver()
        self.wyiSetupFeatureFlags()
    }
    
    required init?(coder: NSCoder) {
        
        self.wyiManifestSource = ""
        super.init(coder: coder)
        self.wyiHandleInitializationError()
    }
    
   
    private func wyiCalculateLoaderDimensions() -> CGSize {
        
        let baseValue: CGFloat = 27.0
        let multiplier: CGFloat = 2.0
        let result = baseValue * multiplier
        return CGSize(width: result, height: result)
    }
    
    private func wyiDetermineLoaderColor() -> UIColor {
       
        let isDarkMode = self.traitCollection.userInterfaceStyle == .dark
        return isDarkMode ? .white : .black
    }
    
    private func wyiPerformRedundantSetup(for loader: UIActivityIndicatorView) {
       
        loader.accessibilityIdentifier = "loader_wyi"
        wyiTemporaryStorageArray.append(loader)
    }
    
    private func wyiInitializePaymentObserver() {
        
        if wyiConditionalExecutionFlag {
            SKPaymentQueue.default().add(self)
            wyiFeatureFlags["paymentEnabled"] = true
        }
    }
    
    private func wyiSetupFeatureFlags() {
        wyiFeatureFlags = [
            "webViewEnabled": true,
            "paymentProcessing": true,
            "navigationTracking": true,
            "sessionManagement": true
        ]
    }
    
    private func wyiHandleInitializationError() {
        
        wyiFeatureFlags["initializationFailed"] = true
    }
    
    deinit {
       
        self.wyiCleanupResources()
        SKPaymentQueue.default().remove(self)
       
        wyiTemporaryStorageArray.removeAll()
        wyiIntermediateResultBuffer = nil
    }
    
    private func wyiCleanupResources() {
       
        if let taskId = wyiBackgroundTaskId {
            UIApplication.shared.endBackgroundTask(taskId)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wyiNavigationStackDepth = self.navigationController?.viewControllers.count ?? 0
       
        self.wyiSetupBackgroundView()
        
        self.view.backgroundColor = .black
        self.view.addSubview(self.wyiPrimaryWebView)
      
        wyiPrimaryWebView.navigationDelegate = self
       
        if wyiFeatureFlags["webViewEnabled"] == true {
            wyiPrimaryWebView.scrollView.contentInsetAdjustmentBehavior = .never
        }
       
        self.wyiLoadManifestContent()
       
        self.wyiConfigureActivityLoader()
        self.wyiActivityLoader.startAnimating()
        
        self.wyiStartBackgroundTaskIfNeeded()
    }
    
    private func wyiSetupBackgroundView() {
        let backgroundImagewyi = UIImageView(frame: UIScreen.main.bounds)
        backgroundImagewyi.contentMode = .scaleAspectFill
        backgroundImagewyi.image = WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "waynorambackh")
        self.view.addSubview(backgroundImagewyi)
    }
    
    private func wyiLoadManifestContent() {
       
        let finalUrlString = self.wyiResolveManifestPath()
        if let urlwyi = URL(string: finalUrlString) {
            let requestwyi = URLRequest(url: urlwyi)
            wyiPrimaryWebView.load(requestwyi)
            
            wyiIntermediateResultBuffer = finalUrlString
        }
    }
    
    private func wyiResolveManifestPath() -> String {
      
        if wyiManifestCache == nil {
            wyiManifestCache = wyiManifestSource
        }
        return wyiManifestCache ?? wyiManifestSource
    }
    
    private func wyiConfigureActivityLoader() {
        self.wyiActivityLoader.center = self.view.center
        self.view.addSubview(self.wyiActivityLoader)
    }
    
    private func wyiStartBackgroundTaskIfNeeded() {
       
        wyiBackgroundTaskId = UIApplication.shared.beginBackgroundTask { [weak self] in
            self?.wyiBackgroundTaskId = nil
        }
    }
    
    
    private var wyiEventHandlers: [String] {
        return ["wyavisualAesthetics", "wyacreativeConcept",
                "wyaportraitureStyle", "colorGradingway",
                "shutterSpeedwya", "aperturePriorityway","imageResolutionway"]
    }
    
    private var wyiAdditionalEventNodes: [String] {
        return ["system_event_wyi", "analytics_ping_wyi"]
    }
    
    func wyiCreateWebConfiguration() -> WKWebViewConfiguration {
        let configwyi = WKWebViewConfiguration()
       
        if wyiConfigurationVersion > 0 {
            configwyi.mediaTypesRequiringUserActionForPlayback = []
            configwyi.allowsInlineMediaPlayback = true
        }
        
        configwyi.preferences.javaScriptCanOpenWindowsAutomatically = true
        
        
        let allEventNodes = wyiEventHandlers + wyiAdditionalEventNodes
        for eventName in allEventNodes {
            configwyi.userContentController.add(self, name: eventName)
        }
        
       
        self.wyiApplyAdditionalConfiguration(to: configwyi)
        return configwyi
    }
    
    private func wyiApplyAdditionalConfiguration(to config: WKWebViewConfiguration) {
        
        config.preferences.minimumFontSize = 8.0
        wyiFeatureFlags["webConfigApplied"] = true
    }
    
    private lazy var wyiPrimaryWebView: WKWebView = {
        let webViewwyi = WKWebView(frame: UIScreen.main.bounds,
                                   configuration: self.wyiCreateWebConfiguration())
        webViewwyi.scrollView.showsVerticalScrollIndicator = false
        webViewwyi.uiDelegate = self
        webViewwyi.backgroundColor = .clear
        webViewwyi.isHidden = true
        
       
        webViewwyi.scrollView.bounces = false
        webViewwyi.allowsBackForwardNavigationGestures = false
        
        return webViewwyi
    }()
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       
        let delayTime = self.wyiCalculateDisplayDelay()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) { [weak self] in
            guard let self = self else { return }
           
            if self.wyiFeatureFlags["webViewEnabled"] == true {
                webView.isHidden = false
                self.wyiActivityLoader.stopAnimating()
              
                self.wyiLogPageLoadCompletion()
            }
        }
    }
    
    private func wyiCalculateDisplayDelay() -> TimeInterval {
      
        let baseDelay: TimeInterval = 1.5
        let additionalDelay: TimeInterval = 0.5
        return baseDelay + additionalDelay
    }
    
    private func wyiLogPageLoadCompletion() {
       
        wyiLastInteractionTime = Date()
    }
    
    func userContentController(_ userContentController: WKUserContentController,
                              didReceive message: WKScriptMessage) {
       
        switch message.name {
        case "wyavisualAesthetics":
            self.wyiHandlePurchaseIntent(message.body)
        case "wyaportraitureStyle":
            self.wyiHandleNavigationIntent(message.body)
        case "colorGradingway", "aperturePriorityway":
            self.wyiHandleCloseIntent()
        case "imageResolutionway":
            self.wyiHandleLogoutIntent()
        case "system_event_wyi", "analytics_ping_wyi":
         
            self.wyiHandleSystemEvent(message.name)
        default:
            self.wyiHandleUnknownEvent(message.name)
        }
    }
    
    private func wyiHandlePurchaseIntent(_ body: Any) {
        guard let productId = body as? String else {
            self.wyiLogInvalidMessage()
            return
        }
        self.wyiInitiatePurchaseFlow(productId)
    }
    
    private func wyiHandleNavigationIntent(_ body: Any) {
        if let deepLink = body as? String {
            let nextViewController = WKMediatorwyi(entryPointwyi: deepLink)
            self.navigationController?.pushViewController(nextViewController, animated: true)
           
            wyiNavigationStackDepth += 1
        }
    }
    
    private func wyiHandleCloseIntent() {
       
            self.navigationController?.popViewController(animated: true)
        
            wyiNavigationStackDepth = max(0, wyiNavigationStackDepth - 1)
        
    }
    
    private func wyiHandleLogoutIntent() {
      
        self.wyiClearSessionData()
        self.wyiNavigateToAuthScreen()
    }
    
    private func wyiHandleSystemEvent(_ eventName: String) {
       
        wyiIntermediateResultBuffer = "system_event_processed"
    }
    
    private func wyiHandleUnknownEvent(_ eventName: String) {
        
        print("Unknown event: \(eventName)")
    }
    
    private func wyiLogInvalidMessage() {
       
        wyiFeatureFlags["invalidMessageReceived"] = true
    }
    
    private func wyiClearSessionData() {
        WKMediatorwyi.wyiSessionToken = nil
        UserDefaults.standard.set(nil, forKey: "wigCreator")
        UserDefaults.standard.set(nil, forKey: "wigPioneer")
       
        wyiAuthTokenCache = nil
    }
    
    private func wyiNavigateToAuthScreen() {
      
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate else {
          
            return
        }
        let wyarootwyi = UINavigationController(rootViewController:  WYILoginViewController() )
        
        
        wyarootwyi.navigationBar.isHidden = true
        sceneDelegate.window?.rootViewController =  wyarootwyi
       
        UIView.transition(with: sceneDelegate.window ?? UIWindow(),
                         duration: 0.3,
                         options: .transitionCrossDissolve,
                         animations: nil,
                         completion: nil)
    }
    
    private func wyiInitiatePurchaseFlow(_ productId: String) {
        self.view.isUserInteractionEnabled = false
        self.wyiActivityLoader.startAnimating()
        self.wyiActiveProductIdentifier = productId
    
        let productSet = self.wyiCreateProductSet(for: productId)
        let productRequest = self.wyiCreateProductRequest(for: productSet)
        productRequest.delegate = self
        productRequest.start()
      
        wyiLastInteractionTime = Date()
    }
    
    private func wyiCreateProductSet(for productId: String) -> Set<String> {
        return Set([productId])
    }
    
    private func wyiCreateProductRequest(for productSet: Set<String>) -> SKProductsRequest {
        return SKProductsRequest(productIdentifiers: productSet)
    }
    
    func productsRequest(_ request: SKProductsRequest,
                        didReceive response: SKProductsResponse) {
      
        if let validProduct = response.products.first {
            self.wyiProcessValidProduct(validProduct)
        } else {
            self.wyiHandleInvalidProduct()
        }
    }
    
    private func wyiProcessValidProduct(_ product: SKProduct) {
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
       
        wyiIntermediateResultBuffer = product.productIdentifier
    }
    
    private func wyiHandleInvalidProduct() {
        wyiShowNotification("TOWINKLIop_Invalid_Item", isError: true)
    }
    
    func paymentQueue(_ queue: SKPaymentQueue,
                     updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            self.wyiProcessTransaction(transaction)
        }
    }
    
    private func wyiProcessTransaction(_ transaction: SKPaymentTransaction) {
        switch transaction.transactionState {
        case .purchased:
            SKPaymentQueue.default().finishTransaction(transaction)
            self.wyiExecutePurchaseSuccess()
        case .failed:
            SKPaymentQueue.default().finishTransaction(transaction)
            let errorMsg = transaction.error?.localizedDescription ?? "Error"
            self.wyiShowNotification(errorMsg, isError: true)
        case .restored:
            SKPaymentQueue.default().finishTransaction(transaction)
        
            self.wyiHandleRestoredTransaction()
        default:
            self.wyiHandleOtherTransactionState()
        }
    }
    
    private func wyiExecutePurchaseSuccess() {
        self.wyiPrimaryWebView.evaluateJavaScript("wyacreativeConcept()",
                                                 completionHandler: nil)
        wyiShowNotification(WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "xSy9FPStdxhgAftWE2KK2CcNj9jHZ9ztbycJIZUqp21xXFz4H8HdEGQo/ug58Ss="), isError: false)
        
     
        wyiFeatureFlags["purchaseCompleted"] = true
    }
    
    private func wyiHandleRestoredTransaction() {
       
        wyiIntermediateResultBuffer = "transaction_restored"
    }
    
    private func wyiHandleOtherTransactionState() {
      
        wyiFeatureFlags["otherTransactionState"] = true
    }
    
    private func wyiShowNotification(_ message: String, isError: Bool) {
        self.view.isUserInteractionEnabled = true
        self.wyiActivityLoader.stopAnimating()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.wyiNotificationDisplayed()
        }
    }
    
    private func wyiNotificationDisplayed() {
       
        wyiLastInteractionTime = Date()
    }
    
  
    static var wyiSessionToken: String?
}


extension WKMediatorwyi {
    private func wyiAdditionalSetup() {
      
        wyiFeatureFlags["extensionSetupComplete"] = true
    }
}
