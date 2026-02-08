//
//  WYIExploreViewController.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/6.
//


import UIKit

class WYIExploreViewController: UIViewController, WYIVoiceClusterCellDelegate {
    func WYIVoiceClusterCellDelegate(tga: String) {
      
        let  wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:WYIRouterCorewyi.RouteTargetwyi.wyiVirtualChat.rawValue)
        
        let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier: wyiroute, queryString: tga))
        self.navigationController?.pushViewController(wyiFeedback, animated: true)
    }
    

    private let wyiDeviceWidth = UIScreen.main.bounds.width
    private let wyiDeviceHeight = UIScreen.main.bounds.height
    
    private var wyiVoiceCatalog: [WYIVoiceEntity] = []
    private var wyiVisualFeed: [WYIFeedEntity] = []

    private lazy var wyiPrimaryStage: UICollectionView = {
        let wyiLayout = UICollectionViewFlowLayout()
        wyiLayout.scrollDirection = .vertical
        wyiLayout.minimumLineSpacing = 10
        wyiLayout.minimumInteritemSpacing = 10
        let wyiView = UICollectionView(frame: .zero, collectionViewLayout: wyiLayout)
        wyiView.backgroundColor = .clear
        wyiView.delegate = self
        wyiView.dataSource = self
        wyiView.register(WYIVoiceClusterCell.self, forCellWithReuseIdentifier: "wyiVoiceCluster")
        wyiView.register(WYIGridActionCell.self, forCellWithReuseIdentifier: "wyiGridAction")
        return wyiView
    }()

    private lazy var wyiTopNavigator: UIView = {
        let wyiNav = UIView()
        let wyiLogo = UIImageView(image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "WYItitile"))
        wyiLogo.contentMode = .scaleAspectFit
        wyiLogo.frame = CGRect(x: 18, y: 0, width: 90, height: 36)
        wyiNav.addSubview(wyiLogo)
        
        let wyiRoomTrigger = UIButton(type: .custom)
       
        wyiRoomTrigger.setBackgroundImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "wyacreate"), for: .normal)
        wyiRoomTrigger.frame = CGRect(x: UIScreen.main.bounds.width - 163, y: 0, width: 163, height: 44)
        
        wyiRoomTrigger.tag = 99
        wyiRoomTrigger.addTarget(self, action: #selector(vintageVibewyi(diff:)), for: .touchUpInside)
        wyiNav.addSubview(wyiRoomTrigger)
        return wyiNav
    }()

    
   @objc func vintageVibewyi(diff:UIButton)  {
       
       
       if diff.tag >= 3000 {
           if let cheinIn = wyiVisualFeed[diff.tag - 3000].alosgiju["nostalgicMoodwyi"] as? String {
               let wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: WYIRouterCorewyi.RouteTargetwyi.wyiMessageDetail.rawValue)
                
               let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier: wyiroute, queryString: "\(cheinIn)"))
                  
                
               self.navigationController?.pushViewController(wyiFeedback, animated: true)
           }
           
           return
       }
       
       var wyiroute = ""
       if diff.tag == 99 {
           wyiroute = WYIRouterCorewyi.RouteTargetwyi.wyiRoomCreator.rawValue
       }else if diff.tag == 199 {
           wyiroute =  WYIRouterCorewyi.RouteTargetwyi.wyiContentPublisher.rawValue
          
       }else if diff.tag == 299 {
           wyiroute =  WYIRouterCorewyi.RouteTargetwyi.wyiReportInterface.rawValue
          
       }
       
       let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier: WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:wyiroute), queryString: ""))
       self.navigationController?.pushViewController(wyiFeedback, animated: true)
       
      
       
       
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wyiInitiateRemoteSync()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagebavk = UIImageView.init(frame: UIScreen.main.bounds)
        imagebavk.image = WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "waynorambackh")
        imagebavk.contentMode = .scaleAspectFill
        self.view.addSubview(imagebavk)
        
        wyiAssembleInterface()
       
        
        
    }

    private func layerBlendingwyi()  {
        WYIHUDCoordinatorwyi.wyiPresentActivityIndicator()
        WYINetworkDispatcherwyi.wyiExecuteNetworkOperation(operationEndpointwyi: "/chmyytjzvtz/dxfzioedfhp", operationPayloadwyi: ["localAdjustmentwyi":"60420695","gamutMappingwyi":1,"toneMappingwyi":8]) { adobeRgbwyi in
           
            WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()
            guard let adobeRg = adobeRgbwyi as? Dictionary<String,Any> ,
                 
                    let sharpeningFilterwyi = adobeRg[WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "iG/LkMq1ZcgMsn/GmYoBTgZcX0W2UDk364On/94oIdDKpIQI")] as? Array<Dictionary<String,Any>>
                    
            else {
                return
            }
            
            var userVioce = Array<WYIVoiceEntity>()
            
            sharpeningFilterwyi.forEach { lag in
                userVioce.append(WYIVoiceEntity.init(wyiId: "", wyiAlias: "", wyiAvatar: "", datadic: lag))
            }
            
            self.wyiVoiceCatalog = userVioce
            self.wyiPrimaryStage.reloadSections(IndexSet(integer: 0))
            
        } completionFailurewyi: {  reoailper in
           
        }
        
        WYINetworkDispatcherwyi.wyiExecuteNetworkOperation(operationEndpointwyi: "/tysfkbwwidz/lcjuh", operationPayloadwyi: ["wideAnglewyi":"60420695","streetStylewyi":1,"fashionEditorialwyi":8]) { adobeRgbwyi in
           
           
            guard let adobeRg = adobeRgbwyi as? Dictionary<String,Any> ,
                 
                    let sharpeningFilterwyi = adobeRg[WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "iG/LkMq1ZcgMsn/GmYoBTgZcX0W2UDk364On/94oIdDKpIQI")] as? Array<Dictionary<String,Any>>
                    
            else {
                return
            }
            
            var userVioce = Array<WYIFeedEntity>()
            
            sharpeningFilterwyi.forEach { lag in
                if lag["moodBoardwyi"] as? String == nil{
                    userVioce.append(WYIFeedEntity.init(wyiId: "", wyiCover: "", wyiMetric: "", alosgiju: lag))
                }
                
            }
            
            self.wyiVisualFeed = userVioce
            self.wyiPrimaryStage.reloadSections(IndexSet(integer: 1))
            
        } completionFailurewyi: {  reoailper in
           
        }
    }
    private func wyiAssembleInterface() {
        view.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        view.addSubview(wyiTopNavigator)
        view.addSubview(wyiPrimaryStage)
        
        wyiTopNavigator.frame = CGRect(x: 0, y: wyiDeviceHeight * 0.06, width: wyiDeviceWidth, height: 50)
        wyiPrimaryStage.frame = CGRect(x: 0, y: wyiDeviceHeight * 0.13, width: wyiDeviceWidth, height: wyiDeviceHeight * 0.87)
    }

    private func wyiInitiateRemoteSync() {
        layerBlendingwyi()
    }
}

extension WYIExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : wyiVisualFeed.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let wyiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "wyiVoiceCluster", for: indexPath) as! WYIVoiceClusterCell
            wyiCell.wyiPopulate(wyiData: wyiVoiceCatalog)
            wyiCell.wyicreate.tag = 199
            wyiCell.wyicreate.addTarget(self, action: #selector(vintageVibewyi(diff:)), for: .touchUpInside)
            wyiCell.deleMiShu = self
            return wyiCell
        } else {
            let wyiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "wyiGridAction", for: indexPath) as! WYIGridActionCell
            wyiCell.wyiConfigure(wyiEntity: wyiVisualFeed[indexPath.item])
            
            wyiCell.wyiReort.tag = 199
            wyiCell.wyiReort.addTarget(self, action: #selector(vintageVibewyi(diff:)), for: .touchUpInside)
            
            
            wyiCell.wywyiCahcom.tag = indexPath.row + 3000
            wyiCell.wywyiCahcom.addTarget(self, action: #selector(vintageVibewyi(diff:)), for: .touchUpInside)
            
            return wyiCell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: wyiDeviceWidth, height:  161 + 27 + 28 )
        }
        let wyiSide = (wyiDeviceWidth - 16 - 16 - 10) / 2
        return CGSize(width: wyiSide, height: wyiSide * 1.4)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if let cheinIn = wyiVisualFeed[indexPath.item].alosgiju["cinematicLookwyi"] as? Int {
                let wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:WYIRouterCorewyi.RouteTargetwyi.wyiDynamicDetail.rawValue)
                 
                let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier: wyiroute, queryString: "\(cheinIn)"))
                   
                 
                self.navigationController?.pushViewController(wyiFeedback, animated: true)
            }
          
           
        }
        
        
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}


