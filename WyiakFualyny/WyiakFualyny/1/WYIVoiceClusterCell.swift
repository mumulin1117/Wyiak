//
//  WYIVoiceClusterCell.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/7.
//

import UIKit
// MARK: - Specialized Subviews

class WYIVoiceClusterCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(wyivioce)
        contentView.addSubview(wyiHorizontalFlow)
        
        contentView.addSubview(wyiexplore)
        contentView.addSubview(wyicreate)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var wyivioce: UIImageView = {
        let wiyimg = UIImageView.init(image: UIImage.init(named: "wyiDisc"))
        wiyimg.frame = CGRect(x: 18, y: 0, width: 192, height: 28)
        wiyimg.contentMode = .scaleAspectFit
        return wiyimg
    }()
    
    
    private lazy var wyiexplore: UIImageView = {
        let wiyimg = UIImageView.init(image: UIImage.init(named: "wyiexplore"))
        wiyimg.frame = CGRect(x: 18, y: 30 + 121 + 37, width: 118, height: 18)
        wiyimg.contentMode = .scaleAspectFit
        return wiyimg
    }()
    
    
   
     lazy var wyicreate: UIButton = {
         let wiyimg = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.width - 28 - 15, y: 30 + 121 + 37, width: 28, height: 28))
           
        wiyimg.setImage(UIImage.init(named: "wyiCamera"), for: .normal)
        return wiyimg
    }()
    
    private var wyiInternalSource: [WYIVoiceEntity] = []
    
    private lazy var wyiHorizontalFlow: UICollectionView = {
        let wyiLayout = UICollectionViewFlowLayout()
        wyiLayout.scrollDirection = .horizontal
        wyiLayout.minimumInteritemSpacing = 15
        wyiLayout.minimumLineSpacing = 12
        let wyiCollection = UICollectionView(frame: CGRect(x: 18, y: 45, width: UIScreen.main.bounds.width - 18, height: 121), collectionViewLayout: wyiLayout)
        wyiCollection.backgroundColor = .clear
        wyiCollection.showsHorizontalScrollIndicator = false
        wyiCollection.delegate = self
        wyiCollection.dataSource = self
        wyiCollection.register(WYIVoiceAvatarCell.self, forCellWithReuseIdentifier: "wyiAvatar")
        return wyiCollection
    }()

    func wyiPopulate(wyiData: [WYIVoiceEntity]) {
        self.wyiInternalSource = wyiData
       
        wyiHorizontalFlow.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wyiInternalSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let wyiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "wyiAvatar", for: indexPath) as! WYIVoiceAvatarCell
        return wyiCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}


class WYIVoiceAvatarCell: UICollectionViewCell {
     let wyiCircleView = UIImageView()
    
    private let wyihearvoiceView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        wyihearvoiceView.image = UIImage(named: "wyihear")
        wyiCircleView.frame = CGRect(x: 0, y: 0, width: 98, height: 98)
        wyihearvoiceView.frame = CGRect(x: 0, y: 88, width:102, height: 28)
        wyiCircleView.layer.cornerRadius = 49
        wyiCircleView.layer.masksToBounds = true
        wyiCircleView.layer.borderWidth = 1
        wyiCircleView.layer.borderColor = UIColor.systemBlue.cgColor
        wyiCircleView.backgroundColor = .lightGray
        contentView.addSubview(wyiCircleView)
        contentView.addSubview(wyihearvoiceView)
    }
    required init?(coder: NSCoder) { fatalError() }
}

// MARK: - Structural Entities

struct WYIVoiceEntity {
    let wyiId: String
    let wyiAlias: String
    let wyiAvatar: String
}
