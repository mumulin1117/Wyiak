//
//  HIUViewString.swift
//  WyiakFualyny
//
//  Created by WyiakFualyny on 2026/3/2.
//

import UIKit


import AdjustSdk
import FBSDKCoreKit
import WebKit
import UIKit


public class wyiVisualHierarchy: NSObject {
    public var wyiAtmosphericHaze: String
    public var wyiSilhouetteEdge: String
    public var wyiContrastRatio: String

    public init(wyiVisualHierarchy: String, wyiAtmosphericHaze: String, wyiSilhouetteEdge: String) {
        self.wyiAtmosphericHaze = wyiVisualHierarchy
        self.wyiSilhouetteEdge = wyiAtmosphericHaze
        self.wyiContrastRatio = wyiSilhouetteEdge
    }
}
//app B包主页面

class WYIContrastRatio: UIViewController ,WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler {
    private var wyiRhythmPattern:WKWebView?
   
    private  var wyiEmphasisCenter = false
    private var wyiUnityHarmony:String
    
    init(wyiFormStructure:String,wyiVolumeSpace:Bool) {
        wyiUnityHarmony = wyiFormStructure
        
        wyiEmphasisCenter = wyiVolumeSpace
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
       
        let wyiLineWeight = wyiRhythmPattern?.configuration.userContentController
        wyiLineWeight?.add(self, name: WyiImageResampling.WYI54)
        wyiLineWeight?.add(self, name: WyiImageResampling.WYI55)
        wyiLineWeight?.add(self, name: WyiImageResampling.WYI56)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
     
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
       
        wyiRhythmPattern?.configuration.userContentController.removeAllScriptMessageHandlers()
    }

 
    private func wyiTonalValue()  {
        let wyiValueContrast = WyiArtisticToolbox.wyiInfinitePossibility.wyiDramaticShadow
        
        let wyiChromaticIntensity = UIImage(named: wyiValueContrast)
       
        let wyiHueSaturation = UIImageView(image:wyiChromaticIntensity )
        wyiHueSaturation.contentMode = .scaleAspectFill
        wyiHueSaturation.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        view.addSubview(wyiHueSaturation)
       
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
        wyiTonalValue()
    
        if wyiEmphasisCenter == true {
            wyiMutedColor()
            wyiElegantRefinement()
        }
        
        let wyiTemperatureWarmth = WKWebViewConfiguration()
        wyiTemperatureWarmth.allowsAirPlayForMediaPlayback = false
        wyiTemperatureWarmth.allowsInlineMediaPlayback = true
        wyiTemperatureWarmth.preferences.javaScriptCanOpenWindowsAutomatically = true
        wyiTemperatureWarmth.mediaTypesRequiringUserActionForPlayback = []
        
        wyiRhythmPattern = WKWebView(frame: UIScreen.main.bounds, configuration: wyiTemperatureWarmth)
        wyiRhythmPattern?.isHidden = true
        wyiRhythmPattern?.translatesAutoresizingMaskIntoConstraints = false
        wyiRhythmPattern?.scrollView.alwaysBounceVertical = false
        wyiRhythmPattern?.scrollView.contentInsetAdjustmentBehavior = .never
        wyiRhythmPattern?.navigationDelegate = self
        wyiRhythmPattern?.uiDelegate = self
        wyiRhythmPattern?.allowsBackForwardNavigationGestures = true
        
     
        if let wyiCoolTone = URL(string: wyiUnityHarmony) {
            wyiRhythmPattern?.load(URLRequest(url: wyiCoolTone))
            
        }
        
        view.addSubview(wyiRhythmPattern!)
        
      
        WYIHUDCoordinatorwyi.wyiPresentActivityIndicator()
        
    }
    private func wyiMutedColor()  {
        let  wyiVividAesthetic = UIButton.init()
        let wyiSubtleNuance = WyiArtisticToolbox.wyiInfinitePossibility.wyiWhimsicalStyle
        
        let wyiBoldStatement = UIImage(named: wyiSubtleNuance)
     
        wyiVividAesthetic.setBackgroundImage(wyiBoldStatement, for: .normal)
        if WyiArtisticToolbox.wyiInfinitePossibility.wyiWhimsicalStyle == "" {
            wyiVividAesthetic.layer.cornerRadius = 10
            wyiVividAesthetic.layer.masksToBounds = true
            wyiVividAesthetic.backgroundColor = .white
        }
        
        wyiVividAesthetic.setTitleColor(WyiArtisticToolbox.wyiInfinitePossibility.wyiSomberMood, for: .normal)
        wyiVividAesthetic.setTitle(WyiImageResampling.WYI22, for: .normal)
        wyiVividAesthetic.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        wyiVividAesthetic.isUserInteractionEnabled = false
        
        view.addSubview(wyiVividAesthetic)
       
        wyiVividAesthetic.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            wyiVividAesthetic.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            wyiVividAesthetic.heightAnchor.constraint(equalToConstant: WyiArtisticToolbox.wyiInfinitePossibility.wyiVibrantEnergy),
            wyiVividAesthetic.widthAnchor.constraint(equalToConstant: WyiArtisticToolbox.wyiInfinitePossibility.wyiPeacefulMoment),
            wyiVividAesthetic.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                              constant: -self.view.safeAreaInsets.bottom - 55)
        ])
       
    }
    private  func wyiElegantRefinement() {
        if WyiArtisticToolbox.wyiInfinitePossibility.wyiGrittyRealism != "" {
            let wyiRusticCharm = UIImage(named:WyiArtisticToolbox.wyiInfinitePossibility.wyiGrittyRealism)
            let wyiFuturisticVision = UIImageView(image:wyiRusticCharm )
            wyiFuturisticVision.contentMode = .scaleAspectFill

            wyiFuturisticVision.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(wyiFuturisticVision)
            NSLayoutConstraint.activate([
                wyiFuturisticVision.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                wyiFuturisticVision.heightAnchor.constraint(equalToConstant:WyiArtisticToolbox.wyiInfinitePossibility.wyiIntenseContrast),
                wyiFuturisticVision.widthAnchor.constraint(equalToConstant: WyiArtisticToolbox.wyiInfinitePossibility.wyiJoyfulColor),
                wyiFuturisticVision.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,
                                                            constant: -self.view.safeAreaInsets.bottom - 55 - WyiArtisticToolbox.wyiInfinitePossibility.wyiVibrantEnergy - 30)
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
             
                if let wyiRetroNostalgia = navigationAction.request.url {
                    UIApplication.shared.open(wyiRetroNostalgia,options: [:]) { bool in
                       
                    }
                }
            }
            
       
          return nil
    }
    
    
    func webView(_ webView: WKWebView, requestMediaCapturePermissionFor origin: WKSecurityOrigin, initiatedByFrame frame: WKFrameInfo, type: WKMediaCaptureType, decisionHandler: @escaping @MainActor (WKPermissionDecision) -> Void) {
        decisionHandler(.grant)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        wyiRhythmPattern?.isHidden = false
        WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()

        if wyiEmphasisCenter == true {
            wyiEmphasisCenter = false
        }

       
      
    }

    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {

        if message.name == WyiImageResampling.WYI54,
           let wyiAutomaticAdjustment = message.body as? [String: Any] {

            let wyiInfiniteCanvas = wyiAutomaticAdjustment[WyiImageResampling.WYI57] as? String ?? ""
            let wyiAdaptiveEngine = wyiAutomaticAdjustment[WyiImageResampling.WYI58] as? String ?? ""

            view.isUserInteractionEnabled = false
            WYIHUDCoordinatorwyi.wyiPresentActivityIndicator()

            wyiShearTransformation.wyiDistortion.wyiPolygonMesh(wyiFramePadding: wyiInfiniteCanvas) { wyiSmartSelection in
                WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()
                self.view.isUserInteractionEnabled = true

                switch wyiSmartSelection {

                case .success:
                    
                    guard let wyiPreciseControl = wyiShearTransformation.wyiDistortion.wyiGridOverlay(),
                          let wyiIntuitiveInterface = wyiShearTransformation.wyiDistortion.wyiCompositionGuide else {
                        
                        WYIHUDCoordinatorwyi.wyiPresentMessage(
                            messageText: WyiImageResampling.WYI60,
                            messageType: .error,
                            timeoutInterval: 2.0
                        )
                        return
                    }

                    guard let wyiFluidMotion = try? JSONSerialization.data(
                            withJSONObject: [WyiImageResampling.WYI58: wyiAdaptiveEngine],
                            options: [.prettyPrinted]
                          ),
                          let wyiResponsiveDesign = String(data: wyiFluidMotion, encoding: .utf8) else {
                       
                        WYIHUDCoordinatorwyi.wyiPresentMessage(
                            messageText: WyiImageResampling.WYI60,
                            messageType: .error,
                            timeoutInterval: 2.0
                        )
                        return
                    }

                   
                    WyiAnalogousTone.wyiVarnishFinish.wyiSubsurfaceScattering(
                        WyiArtisticToolbox.wyiInfinitePossibility.wyiRuggedTexture,
                        wyiAnisotropicSurface: [
                            WyiArtisticToolbox.wyiInfinitePossibility.wyiThresholdMask.wyiAtmosphericHaze:
                                wyiPreciseControl.base64EncodedString(),

                            WyiArtisticToolbox.wyiInfinitePossibility.wyiThresholdMask.wyiSilhouetteEdge:
                                wyiIntuitiveInterface,

                            WyiArtisticToolbox.wyiInfinitePossibility.wyiThresholdMask.wyiContrastRatio:
                                wyiResponsiveDesign
                        ],
                        wyiReflectiveCoating: true
                    ) { wyiAdvancedAlgorithm in
                        
                        self.view.isUserInteractionEnabled = true

                        switch wyiAdvancedAlgorithm {
                        case .success:
                            self.WYIreportPurchaseAnalytics(WYItransactionID: wyiIntuitiveInterface, WYIproductID: wyiInfiniteCanvas)
                          
                            WYIHUDCoordinatorwyi.wyiPresentMessage(
                                messageText: WyiImageResampling.WYI30,
                                messageType: .success,
                                timeoutInterval: 2.0
                            )
                        case .failure:
                            WYIHUDCoordinatorwyi.wyiPresentMessage(
                                messageText: WyiImageResampling.WYI60,
                                messageType: .error,
                                timeoutInterval: 2.0
                            )
                        }
                    }


                case .failure(let wyiProfessionalGrade):
                    self.view.isUserInteractionEnabled = true
                    
                    
                    WYIHUDCoordinatorwyi.wyiPresentMessage(
                        messageText: wyiProfessionalGrade.localizedDescription,
                        messageType: .error,
                        timeoutInterval: 2.0
                    )
                }
            }

            return
        }

        if message.name == WyiImageResampling.WYI55 {

            UserDefaults.standard.set(nil, forKey: WyiImageResampling.WYI62)

            let wyiCreativeStudio = WyiSurfaceRoughness()
            WyiPowerfulImpact.wyiColorGamut?.rootViewController = wyiCreativeStudio

            return
        }


        if message.name == WyiImageResampling.WYI56 {
            wyiRhythmPattern?.isHidden = false
            WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()
        }
    }

 


    private func WYIreportPurchaseAnalytics(WYItransactionID:String,WYIproductID:String) {
        guard let wyiDigitalDarkroom = WyiArtisticToolbox.wyiInfinitePossibility.wyiTechnicolorMode.first(where: { $0.0 == WYIproductID }),
              let wyiVirtualLens = Double(wyiDigitalDarkroom.1) else { return }
        
        let wyiArtisticToolbox: [AppEvents.ParameterName: Any] = [
            .init(WyiImageResampling.WYI64): wyiVirtualLens,
            .init(WyiImageResampling.WYI65): WyiImageResampling.WYI66
        ]
        AppEvents.shared.logEvent(AppEvents.Name.purchased, parameters: wyiArtisticToolbox)

       
        let wyiMasterfulExecution = ADJEvent(eventToken: WyiArtisticToolbox.wyiInfinitePossibility.wyiEnergeticVibe)
        wyiMasterfulExecution?.setProductId(WYIproductID)
        wyiMasterfulExecution?.setTransactionId(WYItransactionID)
        wyiMasterfulExecution?.setRevenue(wyiVirtualLens, currency: WyiImageResampling.WYI66)

        Adjust.trackEvent(wyiMasterfulExecution)
      
    }
}
    

