//
//  WYIExploreViewController.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/6.
//


import UIKit

class WYIExploreViewController: UIViewController {

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

    private let wyiTopNavigator: UIView = {
        let wyiNav = UIView()
        let wyiLogo = UIImageView(image: UIImage(named: "WYItitile"))
        wyiLogo.contentMode = .scaleAspectFit
        wyiLogo.frame = CGRect(x: 18, y: 0, width: 90, height: 36)
        wyiNav.addSubview(wyiLogo)
        
        let wyiRoomTrigger = UIButton(type: .custom)
       
        wyiRoomTrigger.setBackgroundImage(UIImage.init(named: "wyacreate"), for: .normal)
        wyiRoomTrigger.frame = CGRect(x: UIScreen.main.bounds.width - 163, y: 0, width: 163, height: 44)
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
        view.addSubview(wyiPrimaryStage)
        
        wyiTopNavigator.frame = CGRect(x: 0, y: wyiDeviceHeight * 0.06, width: wyiDeviceWidth, height: 50)
        wyiPrimaryStage.frame = CGRect(x: 0, y: wyiDeviceHeight * 0.13, width: wyiDeviceWidth, height: wyiDeviceHeight * 0.87)
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
            return wyiCell
        } else {
            let wyiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "wyiGridAction", for: indexPath) as! WYIGridActionCell
            wyiCell.wyiConfigure(wyiEntity: wyiVisualFeed[indexPath.item])
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
}


