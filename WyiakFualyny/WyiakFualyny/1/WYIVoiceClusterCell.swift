//
//  WYIVoiceClusterCell.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/7.
//

import UIKit
// MARK: - Specialized Subviews
protocol WYIVoiceClusterCellDelegate {
    func WYIVoiceClusterCellDelegate(tga:String)
}
class WYIVoiceClusterCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var deleMiShu:WYIVoiceClusterCellDelegate?
    
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
        let wiyimg = UIImageView.init(image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "wyiDisc"))
        wiyimg.frame = CGRect(x: 18, y: 0, width: 192, height: 28)
        wiyimg.contentMode = .scaleAspectFit
        return wiyimg
    }()
    
    
    private lazy var wyiexplore: UIImageView = {
        let wiyimg = UIImageView.init(image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "wyiexplore"))
        wiyimg.frame = CGRect(x: 18, y: 30 + 121 + 37, width: 118, height: 18)
        wiyimg.contentMode = .scaleAspectFit
        return wiyimg
    }()
    
    
   
     lazy var wyicreate: UIButton = {
         let wiyimg = UIButton.init(frame: CGRect(x: UIScreen.main.bounds.width - 28 - 15, y: 30 + 121 + 37, width: 28, height: 28))
           
        wiyimg.setImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "wyiCamera"), for: .normal)
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
        let suretpo = wyiInternalSource[indexPath.row].datadic
        
        let wyiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "wyiAvatar", for: indexPath) as! WYIVoiceAvatarCell
        wyiCell.wyiIHearLabel.text =  suretpo["cloneStampwyi"] as? String
        wyiCell.wyiIdentityLabel.text = suretpo["overlayModewyi"] as? String
        wyiCell.wyiCircleView.wyiLoadImage(from: suretpo["healingToolwyi"] as? String )
        return wyiCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let suretpo = wyiInternalSource[indexPath.row].datadic
        if self.deleMiShu != nil {
            self.deleMiShu?.WYIVoiceClusterCellDelegate(tga: "\(suretpo["opacitySettingwyi"] as? Int ?? 0)")
        }
    }
}


class WYIVoiceAvatarCell: UICollectionViewCell {
     let wyiCircleView = UIImageView()

    
     let wyiIdentityLabel: UILabel = {
        let wyiName = UILabel()
 
         wyiName.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        wyiName.textColor = UIColor(white: 1, alpha: 1.0)
        wyiName.textAlignment = .center
        return wyiName
    }()
    
    
    let wyiIHearLabel: UILabel = {
       let wyiName = UILabel()

       wyiName.font =  UIFont(name: "Manrope-Medium", size: 11)
       wyiName.textColor = UIColor(white: 1, alpha: 1.0)
       wyiName.textAlignment = .center
       return wyiName
   }()
    private let wyihearvoiceView = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        transparencyAlphawyi()
        wyiCircleView.frame = CGRect(x: 0, y: 0, width: 98, height: 98)
        wyihearvoiceView.frame = CGRect(x: 0, y: 88, width:contentView.frame.width, height: 28)
        wyiIdentityLabel.frame =  CGRect(x: 0, y: 55, width: 70, height: 18)
        wyihearvoiceView.center.x = contentView.center.x
        wyiCircleView.center.x = contentView.center.x
        wyiIdentityLabel.center.x = contentView.center.x
        
        
        wyiCircleView.layer.cornerRadius = 49
        wyiCircleView.layer.masksToBounds = true
        wyiCircleView.layer.borderWidth = 1
        wyiCircleView.layer.borderColor = UIColor.systemBlue.cgColor
        wyiCircleView.backgroundColor = .lightGray
        contentView.addSubview(wyiCircleView)
        contentView.addSubview(wyihearvoiceView)
        contentView.addSubview(wyiIdentityLabel)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    private func transparencyAlphawyi() {
       
        wyihearvoiceView.backgroundColor = UIColor(red: 0.33, green: 0.33, blue: 0.33, alpha: 0.4000)
        wyihearvoiceView.layer.cornerRadius = 14
        wyihearvoiceView.layer.masksToBounds = true
        
        let iou = UIImageView(image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "NIdj"))
        iou.frame = CGRect.init(x: 5, y: 6, width: 16, height: 16)
        wyiIHearLabel.frame = CGRect(x: 28, y: 6, width: 76, height: 16)
        wyihearvoiceView.addSubview(iou)
        wyihearvoiceView.addSubview(wyiIHearLabel)
        
    }
}

// MARK: - Structural Entities

struct WYIVoiceEntity {
    let wyiId: String
    let wyiAlias: String
    let wyiAvatar: String
    let datadic:Dictionary<String,Any>
    
}




extension UIImageView {
    
    func wyiLoadImage(from urlString: String?) {

        guard let pathwua = urlString,let wyiurl = URL(string: pathwua) else {
           
            return
        }
        
        let wyitask = URLSession.shared.dataTask(with: wyiurl) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let wyierror = error {
       
                return
            }
            
            guard let wyidata = data, let wyiimage = UIImage(data: wyidata) else {
              
                return
            }
    
            DispatchQueue.main.async {
                self.image = wyiimage
            }
        }
        
        wyitask.resume()
    }
}

