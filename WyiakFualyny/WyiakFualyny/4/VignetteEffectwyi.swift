//
//  VignetteEffectwyi.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/7.
//

import UIKit

class WYIProfileNexusController: UIViewController {

    private let wyiViewWidth = UIScreen.main.bounds.width
    private let wyiViewHeight = UIScreen.main.bounds.height

    private let wyiEtherealScroll: UIScrollView = {
        let wyiScroll = UIScrollView()
        wyiScroll.backgroundColor = .clear
        wyiScroll.contentInsetAdjustmentBehavior = .never
        wyiScroll.showsVerticalScrollIndicator = false
        return wyiScroll
    }()

    private let wyiChromaHeader: UIImageView = {
        let wyiHeader = UIImageView.init(image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "HeaderIJIyound"))
        wyiHeader.contentMode = .scaleToFill
        return wyiHeader
    }()

    private let wyiAvatarOrb: UIImageView = {
        let wyiImg = UIImageView()
        wyiImg.image = WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakiconsel3")
        wyiImg.backgroundColor = .systemGray5
        wyiImg.contentMode = .scaleAspectFill
        wyiImg.layer.borderWidth = 4
        wyiImg.layer.borderColor = UIColor.white.cgColor
        wyiImg.clipsToBounds = true
        return wyiImg
    }()

    private let wyiIdentityLabel: UILabel = {
        let wyiName = UILabel()
        wyiName.text = ""
        wyiName.font = UIFont.systemFont(ofSize: 24, weight: .black)
        wyiName.textColor = UIColor(white: 0.1, alpha: 1.0)
        wyiName.textAlignment = .center
        return wyiName
    }()

    private let wyiLocationTag: UILabel = {
        let wyiLoc = UILabel()
        wyiLoc.text = ""
        wyiLoc.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        wyiLoc.textColor = .systemGray
        wyiLoc.textAlignment = .center
        return wyiLoc
    }()

    private let wyiSocialMetricsBar: UIView = {
        let wyiBar = UIView()
        wyiBar.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        wyiBar.layer.cornerRadius = 12
        return wyiBar
    }()

  
    private let wyiShortssBar: UIView = {
        let wyiBar = UIView()
        wyiBar.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
       
        return wyiBar
    }()
    
    

    private lazy var wyiEdistTrigger: UIButton = {
        let wyiBtn = UIButton(type: .custom)
        wyiBtn.setImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "wyiEdistTrigger"), for: .normal)
        wyiBtn.tag = 299
        wyiBtn.addTarget(self, action: #selector(vintageVibewyi(diff:)), for: .touchUpInside)
        
        return wyiBtn
    }()
    
    private lazy var wyiSettingsTrigger: UIButton = {
        let wyiBtn = UIButton(type: .custom)
        wyiBtn.setImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "wyiSettingsTrigger"), for: .normal)
        wyiBtn.tag = 199
        wyiBtn.addTarget(self, action: #selector(vintageVibewyi(diff:)), for: .touchUpInside)
       
        return wyiBtn
    }()
    
    private lazy var wyigiftsTrigger: UIButton = {
        let wyiBtn = UIButton(type: .custom)
        wyiBtn.setImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "wyigift"), for: .normal)
        wyiBtn.tag = 99
        wyiBtn.addTarget(self, action: #selector(vintageVibewyi(diff:)), for: .touchUpInside)
       
        return wyiBtn
    }()

    
    
    private lazy var wyishotsTrigger: UIButton = {
        let wyiBtn = UIButton(type: .custom)
     
        wyiBtn.isSelected = true
        wyiBtn.setTitle(WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "YL+K5/LfFG9qfeZli5/raMKr4UexPzGChhj4Ls6tBndem6iHBu62"), for: .normal)
        wyiBtn.setTitleColor(UIColor.white, for: .selected)
        wyiBtn.setTitleColor(UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1), for: .normal)
        wyiBtn.backgroundColor =   UIColor(red: 1, green: 0.26, blue: 0.73, alpha: 1)
        wyiBtn.addTarget(self, action: #selector(sureWYIShia(yuepoiu:)), for: .touchUpInside)
        wyiBtn.layer.cornerRadius = 5
        wyiBtn.layer.masksToBounds = true
        return wyiBtn
    }()
    
    private lazy var wyividoefrTrigger: UIButton = {
        let wyiBtn = UIButton(type: .custom)
        wyiBtn.addTarget(self, action: #selector(sureWYIShia(yuepoiu:)), for: .touchUpInside)
        wyiBtn.isSelected = false
        wyiBtn.setTitle(WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "FsDoOmvazqWDCJx2b6U5z9eof/hp/TOExxHFoP4cQXITdfuFbib/sw=="), for: .normal)
        wyiBtn.setTitleColor(UIColor.white, for: .selected)
        wyiBtn.setTitleColor(UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1), for: .normal)
        wyiBtn.backgroundColor =   .white
        wyiBtn.layer.cornerRadius = 5
        wyiBtn.layer.masksToBounds = true
        return wyiBtn
    }()
    
   @objc func sureWYIShia(yuepoiu:UIButton) {
       wyishotsTrigger.isSelected = false
       wyividoefrTrigger.isSelected = false
       wyishotsTrigger.backgroundColor = .white
       wyividoefrTrigger.backgroundColor = .white
       yuepoiu.isSelected = true
       yuepoiu.backgroundColor =   UIColor(red: 1, green: 0.26, blue: 0.73, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imagebavk = UIImageView.init(frame: UIScreen.main.bounds)
        imagebavk.image = WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "waynorambackh")
        imagebavk.contentMode = .scaleAspectFill
        self.view.addSubview(imagebavk)
        wyiSetupComponentTree()
        wyiApplyLayoutRatios()
    }
    private let wyinopsodtTag: UILabel = {
        let wyiLoc = UILabel()
        wyiLoc.text = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "/42nbPuOAIp3TC82n+4Mybw71dajjCTqITUV3PmMuyFIsqQesGKaMS0fKg==")
        wyiLoc.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        wyiLoc.textColor = .systemGray
        wyiLoc.textAlignment = .center
        return wyiLoc
    }()
    private func wyiSetupComponentTree() {
        view.addSubview(wyiEtherealScroll)
        view.addSubview(wyiSettingsTrigger)
        view.addSubview(wyigiftsTrigger)
       
        
        
        wyiEtherealScroll.addSubview(wyiChromaHeader)
        wyiEtherealScroll.addSubview(wyiAvatarOrb)
        wyiEtherealScroll.addSubview(wyiEdistTrigger)
        
        wyiEtherealScroll.addSubview(wyiIdentityLabel)
        
        
        wyiEtherealScroll.addSubview(wyiLocationTag)
        wyiEtherealScroll.addSubview(wyiSocialMetricsBar)
        
        wyiEtherealScroll.addSubview(wyiShortssBar)
      
//        wyigiftsTrigger.addTarget(self, action: #selector(wyiLaunchEngineSettings), for: .touchUpInside)
//        wyiSettingsTrigger.addTarget(self, action: #selector(wyiLaunchEngineSettings), for: .touchUpInside)
    }

    private func wyiApplyLayoutRatios() {
        wyiEtherealScroll.frame = view.bounds
        
        let wyiHeaderH = wyiViewHeight * 0.22
        wyiChromaHeader.frame = CGRect(x: 0, y: 0, width: wyiViewWidth, height: wyiHeaderH)
        
        let wyiOrbSize = wyiViewWidth * 0.32
        wyiAvatarOrb.frame = CGRect(x: (wyiViewWidth - wyiOrbSize)/2, y: wyiHeaderH - (wyiOrbSize/2), width: wyiOrbSize, height: wyiOrbSize)
        wyiAvatarOrb.layer.cornerRadius = wyiOrbSize / 2
        
        wyiIdentityLabel.frame = CGRect(x: 20, y: wyiAvatarOrb.frame.maxY + 15, width: wyiViewWidth - 40, height: 30)
        wyiLocationTag.frame = CGRect(x: 20, y: wyiIdentityLabel.frame.maxY + 5, width: wyiViewWidth - 40, height: 20)
        
        wyiSocialMetricsBar.frame = CGRect(x: 20, y: wyiLocationTag.frame.maxY + 25, width: wyiViewWidth - 40, height: 65)
        
        
        wyiShortssBar.frame = CGRect(x: 0, y: wyiSocialMetricsBar.frame.maxY + 25, width: wyiViewWidth , height: 51)
        
        wyishotsTrigger.frame = CGRect(x: 10, y: 6, width: (UIScreen.main.bounds.width - 20)/2, height: 39)
        
        wyividoefrTrigger.frame = CGRect(x: 10 + (UIScreen.main.bounds.width - 20)/2, y: 6, width: (UIScreen.main.bounds.width - 20)/2, height: 39)
        
        wyinopsodtTag.frame = CGRect(x: UIScreen.main.bounds.width/2 - 50, y: wyiShortssBar.frame.maxY + 40, width: 100, height: 30)
        wyiShortssBar.addSubview(wyishotsTrigger)
        wyiShortssBar.addSubview(wyividoefrTrigger)
        
        
        
        let wyiGridY = wyiSocialMetricsBar.frame.maxY + 30
        let wyiExpectedH = (wyiViewWidth/2) * 3
       
        wyiEtherealScroll.contentSize = CGSize(width: wyiViewWidth, height: wyiGridY + wyiExpectedH + 100)
        
        wyiEtherealScroll.addSubview(wyinopsodtTag)
        
        wyiSettingsTrigger.frame = CGRect(x: wyiViewWidth - 60, y: 50, width: 44, height: 44)
        wyigiftsTrigger.frame = CGRect(x:16, y: 50, width: 44, height: 44)
        wyiEdistTrigger.frame = CGRect(x:(UIScreen.main.bounds.width - 65)/2, y: wyiAvatarOrb.frame.maxY - 10, width: 65, height: 28)
        
        
        wyiPopulateMetricData()
    }

    private func wyiPopulateMetricData() {
        let wyiFollowerNode = wyiBuildMetricNode(wyiVal: "My", wyiKey: WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "a1rRMYFqCKSOKLId0oguTASkAH2zQJsQjrDsBKrSQLh+XOCavS9s/R8="), wyiX: 0)
        
        wyiFollowerNode.tag = 399
        wyiFollowerNode.addTarget(self, action: #selector(vintageVibewyi(diff:)), for: .touchUpInside)
       
        let wyiFollowingNode = wyiBuildMetricNode(wyiVal: "My", wyiKey: WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "32721cVsXPtR1BtmUtT6zakRM2DzgYNM+zNlXz9fyRmNQMR3YGdB5FU="), wyiX: wyiSocialMetricsBar.frame.width / 2)
        
        wyiFollowingNode.tag = 499
        wyiFollowingNode.addTarget(self, action: #selector(vintageVibewyi(diff:)), for: .touchUpInside)
       
        wyiSocialMetricsBar.addSubview(wyiFollowerNode)
        wyiSocialMetricsBar.addSubview(wyiFollowingNode)
    }

    private func wyiBuildMetricNode(wyiVal: String, wyiKey: String, wyiX: CGFloat) -> UIButton {
        let wyiContainer = UIButton(frame: CGRect(x: wyiX, y: 0, width: wyiSocialMetricsBar.frame.width/2, height: 65))
        let wyiValLbl = UILabel(frame: CGRect(x: 0, y: 12, width: wyiContainer.frame.width, height: 22))
        wyiValLbl.text = wyiVal
        wyiValLbl.font = .systemFont(ofSize: 18, weight: .bold)
        wyiValLbl.textAlignment = .center
        
        let wyiKeyLbl = UILabel(frame: CGRect(x: 0, y: 34, width: wyiContainer.frame.width, height: 18))
        wyiKeyLbl.text = wyiKey
        wyiKeyLbl.font = .systemFont(ofSize: 13)
        wyiKeyLbl.textColor = .lightGray
        wyiKeyLbl.textAlignment = .center
        
        wyiContainer.addSubview(wyiValLbl)
        wyiContainer.addSubview(wyiKeyLbl)
        return wyiContainer
    }

//    @objc private func wyiLaunchEngineSettings() {
//        let wyiImpact = UIImpactFeedbackGenerator(style: .medium)
//        wyiImpact.impactOccurred()
//        
//        let wyiAlert = UIAlertController(title: "Nexus System", message: "Preference module under synchronization.", preferredStyle: .actionSheet)
//        wyiAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
//        present(wyiAlert, animated: true)
//    }
    
    
    @objc func vintageVibewyi(diff:UIButton)  {
        var wyiroute = ""
        if diff.tag == 99 {
            wyiroute = WYIRouterCorewyi.RouteTargetwyi.wyiGiftHistory.rawValue
        }else if diff.tag == 199 {//setting
            wyiroute = WYIRouterCorewyi.RouteTargetwyi.wyiSettingsPanel.rawValue
           
        }else if diff.tag == 299 {
            wyiroute = WYIRouterCorewyi.RouteTargetwyi.wyiAIEditor.rawValue
           
        }else if diff.tag == 399 {
            wyiroute = WYIRouterCorewyi.RouteTargetwyi.wyiFollowerList.rawValue
           
        }else if diff.tag == 499 {
            wyiroute = WYIRouterCorewyi.RouteTargetwyi.wyiFollowingList.rawValue
           
        }
        
        let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier:WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:wyiroute) , queryString: ""))
        self.navigationController?.pushViewController(wyiFeedback, animated: true)
        
        
      
        
        
       
     }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wyiInitiateRemoteSync()
    }
    private func wyiInitiateRemoteSync() {
        layerBlendingwyi()
    }
    private func layerBlendingwyi()  {
        
        guard let WYIid =  UserDefaults.standard.object(forKey: "darkroomProcesswyi") as? Int else { return  }
        WYINetworkDispatcherwyi.wyiExecuteNetworkOperation(operationEndpointwyi: "/gqeubebvlhmlfqz/autkr", operationPayloadwyi: ["interiorDesignwyi":WYIid]) { adobeRgbwyi in
           
          
            guard let adobeRg = adobeRgbwyi as? Dictionary<String,Any> ,
                 
                    let sharpeningFilterwyi = adobeRg[WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "iG/LkMq1ZcgMsn/GmYoBTgZcX0W2UDk364On/94oIdDKpIQI")] as? Dictionary<String,Any>
                    
            else {
                return
            }
            
            self.wyiIdentityLabel.text = sharpeningFilterwyi["lightPaintingwyi"] as? String
            self.wyiAvatarOrb.wyiLoadImage(from: sharpeningFilterwyi["astrophotographywyi"] as? String ?? "")
            self.wyiLocationTag.text = sharpeningFilterwyi["longDistancewyi"] as? String
        } completionFailurewyi: {  reoailper in
           
        }
    }
}

