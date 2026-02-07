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
    
    private var wyiVoiceCatalog: [WYIVoiceEntity] = []
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

    private let wyiTopNavigator: UIView = {
        let wyiNav = UIView()
        let wyiLogo = UIImageView(image: UIImage(named: "WYItitile"))
        wyiLogo.contentMode = .scaleAspectFit
        wyiLogo.frame = CGRect(x: 18, y: 0, width: 90, height: 36)
        wyiNav.addSubview(wyiLogo)
        
        let wyiRoomTrigger = UIButton(type: .custom)
       
        wyiRoomTrigger.setBackgroundImage(UIImage.init(named: "WYIpoost"), for: .normal)
        wyiRoomTrigger.frame = CGRect(x: UIScreen.main.bounds.width - 110 - 12, y: 0, width: 110, height: 44)
        wyiNav.addSubview(wyiRoomTrigger)
        return wyiNav
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
        
        let imagebavk = UIImageView.init(frame: CGRect.init(x: UIScreen.main.bounds.width/2 - 176/2, y: 53 + 40, width: 176, height: 28))
        imagebavk.image = UIImage(named: "WYIokalanp")
        imagebavk.contentMode = .scaleAspectFill
        self.view.addSubview(imagebavk)
        
        
        view.addSubview(wyiPrimaryStage)
        
        wyiTopNavigator.frame = CGRect(x: 0, y: wyiDeviceHeight * 0.06, width: wyiDeviceWidth, height: 50)
        wyiPrimaryStage.frame = CGRect(x: 0, y:imagebavk.frame.maxY + 15 , width: wyiDeviceWidth, height: wyiDeviceHeight - imagebavk.frame.maxY - 5 - 70 - 40 )
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
            return wyiCell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
       
        return CGSize(width: 311, height: wyiDeviceHeight - 53  - 40 - 28 - 5 - 70 - 25)
    }
    
   
}


