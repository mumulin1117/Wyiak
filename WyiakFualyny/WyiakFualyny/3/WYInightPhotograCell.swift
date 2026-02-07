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
        wyiMetricLabel.font = UIFont(name: "Manrope-SemiBold", size: 16)
        
        wyiSayLabel.textColor = UIColor(red: 0.15, green: 0.15, blue: 0.31, alpha: 0.8000)
        wyiSayLabel.font = UIFont(name: "Manrope-ExtraBold", size: 13)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
