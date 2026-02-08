//
//  WYIGridiDesignCell.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/7.
//

import UIKit

class WYIGridiDesignCell: UICollectionViewCell {
    let wyiCoverImage = UIImageView()
    let wyiMetricLabel = UILabel()
    
    lazy var wywyiPrise: UIButton = {
        let wiyimg = UIButton.init(frame: CGRect(x: 14, y: 25, width: 52, height: 52))
        wiyimg.isUserInteractionEnabled = false
       wiyimg.setImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "WYIokalikeun"), for: .normal)
       return wiyimg
   }()
    lazy var wywyiCahcom: UIButton = {
        let wiyimg = UIButton.init(frame: CGRect(x: 14, y: 90, width:52, height: 52))
          
       wiyimg.setImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "WYIokachaou"), for: .normal)
       return wiyimg
   }()
   
   lazy var wyiReort: UIButton = {
       let wiyimg = UIButton.init(frame: CGRect(x: 14, y: 155, width: 52, height: 52))
         
      wiyimg.setImage(WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "WYIokalmore"), for: .normal)
      return wiyimg
  }()
   
   
 
   
    
   
   let wyiMeHatnameLabel = UILabel()

   override init(frame: CGRect) {
       super.init(frame: frame)
       wyiSetupElements()
       self.backgroundColor = .clear
       wyifever()
   }
   
   required init?(coder: NSCoder) { fatalError() }

   private func wyiSetupElements() {
       wyiCoverImage.layer.cornerRadius = 25
       wyiCoverImage.clipsToBounds = true
       wyiCoverImage.backgroundColor = .systemGray5
       wyiCoverImage.frame = contentView.bounds
       contentView.addSubview(wyiCoverImage)
       wyiCoverImage.contentMode = .scaleAspectFill
       
       wyiMetricLabel.font = .systemFont(ofSize: 11, weight: .medium)
       wyiMetricLabel.textColor = .white
       wyiMetricLabel.frame = CGRect(x: 20, y: contentView.bounds.height - 40 - 14, width: contentView.bounds.width - 40, height: 40)
       contentView.addSubview(wyiMetricLabel)
       
       let wyihatImage = UIImageView(image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "WYIokaline"))
       wyihatImage.frame = CGRect(x: 20, y: contentView.bounds.height - 40 - 14 - 24 - 11, width: 24, height: 24)
       contentView.addSubview(wyihatImage)
       
       
       let onlinefor = UILabel()
       onlinefor.text = "Online"
       onlinefor.font = .systemFont(ofSize: 14, weight: .medium)
       onlinefor.textColor = .white
       onlinefor.frame = CGRect(x: 20 + 24 + 10, y: contentView.bounds.height - 40 - 14 - 24 - 11, width: 50, height: 24)
       contentView.addSubview(onlinefor)
       
       contentView.addSubview(wyiReort)
       contentView.addSubview(wywyiCahcom)
       
    
       
       
       wyiMeHatnameLabel.font = .systemFont(ofSize: 23, weight: .bold)
       wyiMeHatnameLabel.textColor = .white
       wyiMeHatnameLabel.text = "name"
       wyiMeHatnameLabel.frame = CGRect(x: 20, y:  contentView.bounds.height - 40 - 14 - 24 - 11 - 24 - 8, width: 100, height:24)
       
       contentView.addSubview(wyiMeHatnameLabel)
   }

    
    
    
    
    func wyifever()  {
        
        let wyihatImage = UIImageView(image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "VectorWYIoka"))
        wyihatImage.frame = CGRect(x: contentView.bounds.width - 80, y:  0, width: 80, height: 233)
        wyihatImage.contentMode = .scaleToFill
        contentView.addSubview(wyihatImage)
        wyihatImage.isUserInteractionEnabled = true
        wyihatImage.addSubview(wywyiPrise)
        wyihatImage.addSubview(wywyiCahcom)
        wyihatImage.addSubview(wyiReort)
        wyihatImage.center.y = contentView.center.y - 40
        
        let hemaPlauguin = UIImageView(image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "hemaPlauguin"))
        hemaPlauguin.frame = CGRect(x: (contentView.bounds.width - 64)/2, y:  0, width: 64, height: 64)
        hemaPlauguin.center.y = contentView.center.y - 20
        contentView.addSubview(hemaPlauguin)
        
    }
    
   func wyiConfigure(wyiEntity: WYIFeedEntity) {
       wyiMeHatnameLabel.text = wyiEntity.alosgiju["etherealGlowwyi"] as? String
       
       wyiMetricLabel.text = wyiEntity.alosgiju["vintageVibewyi"] as? String
       wyiCoverImage.wyiLoadImage(from: wyiEntity.alosgiju["moodBoardwyi"] as? String)
       
      
   }
}
