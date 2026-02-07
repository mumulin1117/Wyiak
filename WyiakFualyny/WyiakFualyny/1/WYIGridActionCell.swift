//
//  WYIGridActionCell.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/7.
//

import UIKit

class WYIGridActionCell: UICollectionViewCell {
     let wyiCoverImage = UIImageView()
    lazy var wyiReort: UIButton = {
        let wiyimg = UIButton.init(frame: CGRect(x: 10, y: 10, width: 24, height: 24))
          
       wiyimg.setImage(UIImage.init(named: "wyiAlert"), for: .normal)
       return wiyimg
   }()
    
    
    lazy var wywyiCahcom: UIButton = {
        let wiyimg = UIButton.init(frame: CGRect(x: (UIScreen.main.bounds.width - 32 - 10)/2 - 32, y: 10, width: 24, height: 24))
          
       wiyimg.setImage(UIImage.init(named: "wyiCahcom"), for: .normal)
       return wiyimg
   }()
   
    
     let wyiMetricLabel = UILabel()
    
    let wyiMeHatCountLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        wyiSetupElements()
    }
    
    required init?(coder: NSCoder) { fatalError() }

    private func wyiSetupElements() {
        wyiCoverImage.layer.cornerRadius = 18
        wyiCoverImage.clipsToBounds = true
        wyiCoverImage.backgroundColor = .systemGray5
        wyiCoverImage.frame = contentView.bounds
        contentView.addSubview(wyiCoverImage)
        wyiCoverImage.contentMode = .scaleAspectFill
        
        wyiMetricLabel.font = .systemFont(ofSize: 11, weight: .medium)
        wyiMetricLabel.textColor = .white
        wyiMetricLabel.frame = CGRect(x: 10, y: contentView.bounds.height - 27 - 25, width: (UIScreen.main.bounds.width - 32 - 10)/2 - 20, height: 15)
        
        
        
     
        contentView.addSubview(wyiMetricLabel)
        
       
        contentView.addSubview(wyiReort)
        contentView.addSubview(wywyiCahcom)
        
        let wyihatImage = UIImageView(image: UIImage.init(named: "colocaih"))
        wyihatImage.frame = CGRect(x: 10, y:  contentView.bounds.height - 24, width: 11, height: 11)
        contentView.addSubview(wyihatImage)
        
        
        wyiMeHatCountLabel.font = .systemFont(ofSize: 11, weight: .medium)
        wyiMeHatCountLabel.textColor = .white
        wyiMeHatCountLabel.text = "0"
        wyiMeHatCountLabel.frame = CGRect(x: 10 + 11 + 5, y:  contentView.bounds.height - 24, width: 50, height: 11)
        
        contentView.addSubview(wyiMeHatCountLabel)
    }

    func wyiConfigure(wyiEntity: WYIFeedEntity) {
        wyiMetricLabel.text = "❤️ \(wyiEntity.wyiMetric)ddddddddd"
    }
}



struct WYIFeedEntity {
    let wyiId: String
    let wyiCover: String
    let wyiMetric: String
}
