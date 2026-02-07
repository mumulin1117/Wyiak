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
        wyiView.register(WYInightPhotograCell.self, forCellWithReuseIdentifier: "WYInightPhotograCell")
        return wyiView
    }()
    
    private let wyiTopNavigator: UIView = {
        let wyiNav = UIView()
        let wyiLogo = UIImageView(image: UIImage(named: "WYItitile"))
        wyiLogo.contentMode = .scaleAspectFit
        wyiLogo.frame = CGRect(x: 18, y: 0, width: 90, height: 36)
        wyiNav.addSubview(wyiLogo)
        
        let wyiRoomTrigger = UIButton(type: .custom)
        wyiRoomTrigger.layer.masksToBounds = true
        wyiRoomTrigger.layer.cornerRadius = 10.5
        wyiRoomTrigger.backgroundColor =  UIColor(red: 0.33, green: 0.33, blue: 0.33, alpha: 0.4000)
        wyiRoomTrigger.setTitle("0 coins", for: .normal)
        wyiRoomTrigger.setTitleColor(UIColor.white, for: .normal)
        wyiRoomTrigger.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 13.5)
        wyiRoomTrigger.frame = CGRect(x: UIScreen.main.bounds.width - 101 - 19, y: 0, width: 101, height: 25)
        
        let imagebavk = UIImageView.init(frame: CGRect(x: UIScreen.main.bounds.width - 48 - 90, y: -10, width: 48, height: 48))
        imagebavk.image = UIImage(named: "rabertsoni")
        imagebavk.contentMode = .scaleAspectFill
        
       
        wyiNav.addSubview(wyiRoomTrigger)
        wyiNav.addSubview(imagebavk)
        return wyiNav
    }()
    
    
    lazy var wyiSymmessagrTrigger: UIButton = {
        let wyiRoomTrigger = UIButton(type: .custom)
       
        wyiRoomTrigger.frame = CGRect(x: 15, y: wyiDeviceHeight * 0.06 + 13 + 30, width: (wyiDeviceWidth - 45)/2, height: 146)
        wyiRoomTrigger.setImage(UIImage.init(named: "wyiSymmessagrTrigger"), for: .normal)
        return wyiRoomTrigger
    }()
    lazy var wyiSymLumalenTrigger: UIButton = {
        let wyiRoomTrigger = UIButton(type: .custom)
       
        wyiRoomTrigger.frame = CGRect(x: 30 + (wyiDeviceWidth - 45)/2, y: wyiDeviceHeight * 0.06 + 13 + 30, width: (wyiDeviceWidth - 45)/2, height: 146)
        wyiRoomTrigger.setImage(UIImage.init(named: "wyiSLimmlenTrigger"), for: .normal)
        return wyiRoomTrigger
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imagebavk = UIImageView.init(frame: UIScreen.main.bounds)
        imagebavk.image = UIImage(named: "waynorambackh")
        imagebavk.contentMode = .scaleAspectFill
        self.view.addSubview(imagebavk)
        
        wyiAssembleInterface()
        wyiInitiateRemoteSync()
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
        wyiMetricLabel.text = "Chats"
        wyiMetricLabel.frame = CGRect(x: 20, y: wyiSymmessagrTrigger.frame.maxY + 20, width:70, height: 28)
        view.addSubview(wyiMetricLabel)
        
        wyiPrimaryStage.frame = CGRect(x: 0, y:wyiMetricLabel.frame.maxY  + 10, width: wyiDeviceWidth, height: wyiDeviceHeight - wyiMetricLabel.frame.maxY - 30 )
       
       
    }
    
    private func wyiInitiateRemoteSync() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1.5)
            let wyiMockVoice = (0...5).map { WYIVoiceEntity(wyiId: "\($0)", wyiAlias: "Aiko", wyiAvatar: "wyi_p\($0)") }
            let wyiMockFeed = (0...10).map { WYIFeedEntity(wyiId: "\($0)", wyiCover: "wyi_c\($0)", wyiMetric: "1900") }
            
            DispatchQueue.main.async {
                self.wyiVoiceCatalog = wyiMockVoice
                self.wyiVisualFeed = wyiMockFeed
                self.wyiPrimaryStage.reloadData()
            }
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
        
        let wyiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WYInightPhotograCell", for: indexPath) as! WYInightPhotograCell
//        wyiCell.wyiConfigure(wyiEntity: wyiVisualFeed[indexPath.item])
        return wyiCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: UIScreen.main.bounds.width, height: 56)
    }
    
    
    
}


