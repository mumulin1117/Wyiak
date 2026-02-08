//
//  WYInightPhotograCell.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/7.
//

import UIKit

class WYInightPhotograCell: UICollectionViewCell {
    let wyiCUsermage = UIImageView()
    let wyiMetricLabel = UILabel()
    
    
    let wyiSayLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        wyiCUsermage.contentMode = .scaleAspectFill
        
        wyiCUsermage.layer.cornerRadius = 28
        wyiCUsermage.layer.masksToBounds = true
        
        wyiMetricLabel.textColor = .black
        wyiMetricLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        wyiSayLabel.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.31, alpha: 0.8000)
        wyiSayLabel.font = UIFont(name: "Manrope-ExtraBold", size: 13)
        wyiCUsermage.frame = CGRect(x: 20, y: 0, width: 56, height: 56)
        
        wyiMetricLabel.frame = CGRect(x: 20 + 56 + 10, y: 5, width:100, height:25)
        
        wyiSayLabel.frame = CGRect(x:20 + 56 + 15, y: 5 + 25 + 3, width: 200, height: 25)
        contentView.addSubview(wyiCUsermage)
        contentView.addSubview(wyiMetricLabel)
        contentView.addSubview(wyiSayLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
