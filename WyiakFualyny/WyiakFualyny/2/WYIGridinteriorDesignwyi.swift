//
//  WYIGridinteriorDesignwyi.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/7.
//

import UIKit

class WYIGridinteriorDesignwyi: UIViewController {

    private let wyiDeviceWidth = UIScreen.main.bounds.width
    private let wyiDeviceHeight = UIScreen.main.bounds.height
  
    private var wyiVisualFeed: [WYIFeedEntity] = []

    private lazy var wyiPrimaryStage: UICollectionView = {
        let wyiLayout = UICollectionViewFlowLayout()
        wyiLayout.scrollDirection = .horizontal
        wyiLayout.minimumLineSpacing = 10
        wyiLayout.minimumInteritemSpacing = 10
        let wyiView = UICollectionView(frame: .zero, collectionViewLayout: wyiLayout)
        wyiView.backgroundColor = .clear
        wyiView.delegate = self
        wyiView.dataSource = self
        wyiView.register(WYIGridiDesignCell.self, forCellWithReuseIdentifier: "WYIGridiDesignCell")
       
        return wyiView
    }()

    private lazy var wyiTopNavigator: UIView = {
        let wyiNav = UIView()
        let wyiLogo = UIImageView(image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "WYItitile"))
        wyiLogo.contentMode = .scaleAspectFit
        wyiLogo.frame = CGRect(x: 18, y: 0, width: 90, height: 36)
        wyiNav.addSubview(wyiLogo)
        
        let wyiRoomTrigger = UIButton(type: .custom)
        wyiRoomTrigger.tag = 99
        wyiRoomTrigger.addTarget(self, action: #selector( vintageVibewyi(diff:)), for: .touchUpInside)
        
        wyiRoomTrigger.setBackgroundImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "WYIpoost"), for: .normal)
        wyiRoomTrigger.frame = CGRect(x: UIScreen.main.bounds.width - 110 - 12, y: 0, width: 110, height: 44)
        wyiNav.addSubview(wyiRoomTrigger)
        return wyiNav
    }()
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

    private func wyiAssembleInterface() {
        view.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        view.addSubview(wyiTopNavigator)
        
        let imagebavk = UIImageView.init(frame: CGRect.init(x: UIScreen.main.bounds.width/2 - 176/2, y: 53 + 40, width: 176, height: 28))
        imagebavk.image = WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "WYIokalanp")
        imagebavk.contentMode = .scaleAspectFill
        self.view.addSubview(imagebavk)
        
        
        view.addSubview(wyiPrimaryStage)
        
        wyiTopNavigator.frame = CGRect(x: 0, y: wyiDeviceHeight * 0.06, width: wyiDeviceWidth, height: 50)
        wyiPrimaryStage.frame = CGRect(x: 0, y:imagebavk.frame.maxY + 15 , width: wyiDeviceWidth, height: wyiDeviceHeight - imagebavk.frame.maxY - 5 - 70 - 40 )
    }

    private func wyiInitiateRemoteSync() {
        layerBlendingwyi()
    }
    
    private func layerBlendingwyi()  {
        WYIHUDCoordinatorwyi.wyiPresentActivityIndicator()
      
        
        WYINetworkDispatcherwyi.wyiExecuteNetworkOperation(operationEndpointwyi: "/tysfkbwwidz/lcjuh", operationPayloadwyi: ["wideAnglewyi":"60420695","streetStylewyi":1,"fashionEditorialwyi":8]) { adobeRgbwyi in
           
            WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()
            guard let adobeRg = adobeRgbwyi as? Dictionary<String,Any> ,
                 
                    let sharpeningFilterwyi = adobeRg[WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "iG/LkMq1ZcgMsn/GmYoBTgZcX0W2UDk364On/94oIdDKpIQI")] as? Array<Dictionary<String,Any>>
                    
            else {
                return
            }
            
            var userVioce = Array<WYIFeedEntity>()
            
            sharpeningFilterwyi.forEach { lag in
                if lag["moodBoardwyi"] as? String != nil{
                    userVioce.append(WYIFeedEntity.init(wyiId: "", wyiCover: "", wyiMetric: "", alosgiju: lag))
                }
                
            }
            
            self.wyiVisualFeed = userVioce
            self.wyiPrimaryStage.reloadData()
            
        } completionFailurewyi: {  reoailper in
           
        }
    }
}

extension WYIGridinteriorDesignwyi: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  wyiVisualFeed.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let wyiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WYIGridiDesignCell", for: indexPath) as! WYIGridiDesignCell
            wyiCell.wyiConfigure(wyiEntity: wyiVisualFeed[indexPath.item])
        wyiCell.wyiReort.tag = 299
        wyiCell.wyiReort.addTarget(self, action: #selector( vintageVibewyi(diff:)), for: .touchUpInside)
        wyiCell.wywyiCahcom.tag = 3000 + indexPath.row
        wyiCell.wywyiCahcom.addTarget(self, action: #selector( vintageVibewyi(diff:)), for: .touchUpInside)
            return wyiCell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
       
        return CGSize(width: 311, height: wyiDeviceHeight - 53  - 40 - 28 - 5 - 70 - 25)
    }
    
    @objc func vintageVibewyi(diff:UIButton)  {
        
        if diff.tag >= 3000 {
            if let cheinIn = wyiVisualFeed[diff.tag - 3000].alosgiju["nostalgicMoodwyi"] as? String {
                let wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:WYIRouterCorewyi.RouteTargetwyi.wyiMessageDetail.rawValue) 
                 
                let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier: wyiroute, queryString: "\(cheinIn)"))
                   
                 
                self.navigationController?.pushViewController(wyiFeedback, animated: true)
            }
            return
        }
        
        
        var wyiroute = ""
        if diff.tag == 99 {
            wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:WYIRouterCorewyi.RouteTargetwyi.wyiVideoPublisher.rawValue)
        }else if diff.tag == 299 {
            wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:WYIRouterCorewyi.RouteTargetwyi.wyiReportInterface.rawValue)
           
        }
        
        let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier: wyiroute, queryString: ""))
        self.navigationController?.pushViewController(wyiFeedback, animated: true)
        
        
       
        
        
        
       
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cheinIn = wyiVisualFeed[indexPath.item].alosgiju["cinematicLookwyi"] as? Int {
            let wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:WYIRouterCorewyi.RouteTargetwyi.wyiVideoDetail.rawValue)
             
            let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier: wyiroute, queryString: "\(cheinIn)"))
               
             
            self.navigationController?.pushViewController(wyiFeedback, animated: true)
        }
      
        
       
    }
    
}


