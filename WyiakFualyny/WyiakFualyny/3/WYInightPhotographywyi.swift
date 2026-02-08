//
//  WYInightPhotographywyi.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/7.
//

import UIKit

class WYInightPhotographywyi: UIViewController {
    
    private let wyiDeviceWidth = UIScreen.main.bounds.width
    private let wyiDeviceHeight = UIScreen.main.bounds.height
    
   
    private var wyiVisualFeed: [Dictionary<String,Any>] = []
    
    private lazy var wyiPrimaryStage: UICollectionView = {
        let wyiLayout = UICollectionViewFlowLayout()
        wyiLayout.scrollDirection = .vertical
        wyiLayout.minimumLineSpacing = 10
        wyiLayout.minimumInteritemSpacing = 10
        let wyiView = UICollectionView(frame: .zero, collectionViewLayout: wyiLayout)
        wyiView.backgroundColor = .clear
        wyiView.delegate = self
        wyiView.dataSource = self
        wyiView.register(WYInightPhotograCell.self, forCellWithReuseIdentifier: "WYInightPhotograCell")
        return wyiView
    }()
    private let wyinopsodtTag: UILabel = {
        let wyiLoc = UILabel()
        wyiLoc.text = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "/PZ5OgAef3P7cQlkvCMkz6Q6Ts1/396F7eeStujTnByuAfcFs4+VXILbNkbH9A==")
        wyiLoc.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        wyiLoc.textColor = .systemGray
        wyiLoc.isHidden = true
        wyiLoc.textAlignment = .center
        return wyiLoc
    }()
    private lazy var wyiTopNavigator: UIView = {
        let wyiNav = UIView()
        let wyiLogo = UIImageView(image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "WYItitile"))
        wyiLogo.contentMode = .scaleAspectFit
        wyiLogo.frame = CGRect(x: 18, y: 0, width: 90, height: 36)
        wyiNav.addSubview(wyiLogo)
        
        let wyiRoomTrigger = UIButton(type: .custom)
        wyiRoomTrigger.layer.masksToBounds = true
        wyiRoomTrigger.layer.cornerRadius = 10.5
        wyiRoomTrigger.backgroundColor =  UIColor(red: 0.33, green: 0.33, blue: 0.33, alpha: 0.4000)
        wyiRoomTrigger.setTitle(WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "cOkQIKI7RwXHXtOigdFce0i4w3bh/9L3pZ3KYuvlHtoGHe8kexkw"), for: .normal)
        wyiRoomTrigger.setTitleColor(UIColor.white, for: .normal)
        wyiRoomTrigger.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 13.5)
        wyiRoomTrigger.frame = CGRect(x: UIScreen.main.bounds.width - 101 - 19, y: 0, width: 101, height: 25)
        wyiRoomTrigger.tag = 99
        wyiRoomTrigger.addTarget(self, action: #selector( vintageVibewyi(diff:)), for: .touchUpInside)
       
        let imagebavk = UIImageView.init(frame: CGRect(x: UIScreen.main.bounds.width - 48 - 90, y: -10, width: 48, height: 48))
        imagebavk.image = WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "rabertsoni")
        imagebavk.contentMode = .scaleAspectFill
        
       
        wyiNav.addSubview(wyiRoomTrigger)
        wyiNav.addSubview(imagebavk)
        return wyiNav
    }()
    
    
    lazy var wyiSymmessagrTrigger: UIButton = {
        let wyiRoomTrigger = UIButton(type: .custom)
       
        wyiRoomTrigger.frame = CGRect(x: 15, y: wyiDeviceHeight * 0.06 + 13 + 30, width: (wyiDeviceWidth - 45)/2, height: 146)
        wyiRoomTrigger.setImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "wyiSymmessagrTrigger"), for: .normal)
        wyiRoomTrigger.tag = 299
        wyiRoomTrigger.addTarget(self, action: #selector( vintageVibewyi(diff:)), for: .touchUpInside)
       
        
        
        return wyiRoomTrigger
    }()
    lazy var wyiSymLumalenTrigger: UIButton = {
        let wyiRoomTrigger = UIButton(type: .custom)
       
        wyiRoomTrigger.frame = CGRect(x: 30 + (wyiDeviceWidth - 45)/2, y: wyiDeviceHeight * 0.06 + 13 + 30, width: (wyiDeviceWidth - 45)/2, height: 146)
        
        wyiRoomTrigger.tag = 199
        wyiRoomTrigger.addTarget(self, action: #selector( vintageVibewyi(diff:)), for: .touchUpInside)
       
        wyiRoomTrigger.setImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "wyiSLimmlenTrigger"), for: .normal)
        return wyiRoomTrigger
    }()
    
    
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
        view.addSubview(wyiSymmessagrTrigger)
        view.addSubview(wyiSymLumalenTrigger)
      
        view.addSubview(wyiPrimaryStage)
        
        wyiTopNavigator.frame = CGRect(x: 0, y: wyiDeviceHeight * 0.06, width: wyiDeviceWidth, height: 50)
       
        
        let wyiMetricLabel = UILabel()
        wyiMetricLabel.font = .systemFont(ofSize: 23, weight: .semibold)
        wyiMetricLabel.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.31, alpha: 1)
        wyiMetricLabel.text = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "5vntuNOqUtUN3eEpCAOyEw6ETYnhUdsxEapDHEr9lupmNqEWgw==")
        wyiMetricLabel.frame = CGRect(x: 20, y: wyiSymmessagrTrigger.frame.maxY + 20, width:70, height: 28)
        view.addSubview(wyiMetricLabel)
        
        wyiPrimaryStage.frame = CGRect(x: 0, y:wyiMetricLabel.frame.maxY  + 10, width: wyiDeviceWidth, height: wyiDeviceHeight - wyiMetricLabel.frame.maxY - 30 )
       
        wyinopsodtTag.frame =  CGRect(x: 0, y:wyiMetricLabel.frame.maxY  + 50, width: wyiDeviceWidth, height: 30 )
        view.addSubview(wyinopsodtTag)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wyiInitiateRemoteSync()
    }
    
    private func wyiInitiateRemoteSync() {
        layerBlendingwyi()
    }
    private func layerBlendingwyi()  {
        WYIHUDCoordinatorwyi.wyiPresentActivityIndicator()
      
        
        WYINetworkDispatcherwyi.wyiExecuteNetworkOperation(operationEndpointwyi: "/jqykotpoifekklbz/jgrckybb", operationPayloadwyi: ["candidMomentwyi":"60420695"]) { adobeRgbwyi in
           
            WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()
            guard let adobeRg = adobeRgbwyi as? Dictionary<String,Any> ,
                 
                    let sharpeningFilterwyi = adobeRg[WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "iG/LkMq1ZcgMsn/GmYoBTgZcX0W2UDk364On/94oIdDKpIQI")] as? Array<Dictionary<String,Any>>
                    
            else {
                return
            }
            
           
            
            self.wyiVisualFeed = sharpeningFilterwyi.map { dix in
                if let apldoi = (dix["documentaryStylewyi"] as? Array<[String:Any]>)?.first{
                    apldoi
                }else{
                    [:]
                    
                }
                
                
            }
            self.wyinopsodtTag.isHidden = (self.wyiVisualFeed.count > 0)
           
            self.wyiPrimaryStage.reloadData()
            
        } completionFailurewyi: {  reoailper in
           
        }
    }
}

extension WYInightPhotographywyi: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  wyiVisualFeed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yaqian = wyiVisualFeed[indexPath.item]
        
        let wyiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WYInightPhotograCell", for: indexPath) as! WYInightPhotograCell
       
        wyiCell.wyiMetricLabel.text = yaqian["naturePhotographywyi"] as? String
        
        wyiCell.wyiSayLabel.text = yaqian["actionShotwyi"] as? String
        wyiCell.wyiCUsermage.wyiLoadImage(from: yaqian["botanicalDetailwyi"] as? String)
        
        return wyiCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: UIScreen.main.bounds.width, height: 56)
    }
    
    @objc func vintageVibewyi(diff:UIButton)  {
        var wyiroute = ""
        if diff.tag == 99 {
            wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: WYIRouterCorewyi.RouteTargetwyi.wyiWalletView.rawValue)
        }else if diff.tag == 199 {
            wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:WYIRouterCorewyi.RouteTargetwyi.wyiAIRobot.rawValue)
           
        }else if diff.tag == 299 {
            wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:WYIRouterCorewyi.RouteTargetwyi.wyiNotificationHub.rawValue)
           
        }
        
        let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier: wyiroute, queryString: ""))
        self.navigationController?.pushViewController(wyiFeedback, animated: true)
        
        
      
        
        
       
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cheinIn = wyiVisualFeed[indexPath.row]["nostalgicMoodwyi"] as? Int {
            let wyiroute = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:WYIRouterCorewyi.RouteTargetwyi.wyiMessageDetail.rawValue)
             
            let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier: wyiroute, queryString: "\(cheinIn)"))
               
             
            self.navigationController?.pushViewController(wyiFeedback, animated: true)
        }
        
       
    }
    
}


