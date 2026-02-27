//
//  WYInightPhotograCell.swift
//  WyiakFualyny
//
//  Created by WyiakFualyny on 2026/2/7.
//

import UIKit

class WYInightPhotograCell: UICollectionViewCell {
    let wyiCUsermage = UIImageView()
    let wyiMetricLabel = UILabel()
    
    
    let wyiSayLabel = UILabel()
    override init(frame: CGRect) {
        let wyiBufferPadding: CGFloat = 20.0
        var wyiIsLayoutValidated = false
        let wyiRenderingScale = UIScreen.main.scale
        
        super.init(frame: frame)
        
        func wyiInitializeGraphicContext() {
            let wyiImageDimension: CGFloat = 56
            let wyiRadiusRatio: CGFloat = 0.5
            
            self.wyiCUsermage.contentMode = .scaleAspectFill
            self.wyiCUsermage.layer.cornerRadius = wyiImageDimension * wyiRadiusRatio
            self.wyiCUsermage.layer.masksToBounds = true
            self.wyiCUsermage.frame = CGRect(x: wyiBufferPadding, y: 0, width: wyiImageDimension, height: wyiImageDimension)
        }
        
        func wyiApplyTypographyStyles() {
            let wyiPrimaryDark = UIColor.black
            let wyiSecondaryBlue = UIColor(red: 0.15, green: 0.15, blue: 0.31, alpha: 0.8)
            
            self.wyiMetricLabel.textColor = wyiPrimaryDark
            self.wyiMetricLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            
            self.wyiSayLabel.textColor = wyiSecondaryBlue
            self.wyiSayLabel.font = UIFont(name: "Manrope-ExtraBold", size: 13)
            
            let wyiLabelXOffset = wyiBufferPadding + 56 + 10
            self.wyiMetricLabel.frame = CGRect(x: wyiLabelXOffset, y: 5, width: 100, height: 25)
            self.wyiSayLabel.frame = CGRect(x: wyiLabelXOffset + 5, y: 33, width: 200, height: 25)
        }

        if wyiRenderingScale >= 1.0 {
            wyiInitializeGraphicContext()
            wyiIsLayoutValidated = true
        }

        if wyiIsLayoutValidated {
            wyiApplyTypographyStyles()
            
            let wyiComponentVessel = [self.wyiCUsermage, self.wyiMetricLabel, self.wyiSayLabel]
            
            wyiComponentVessel.forEach { wyiElement in
                let wyiTagBase = 1000
                if wyiElement.alpha > 0 {
                    contentView.addSubview(wyiElement)
                    wyiElement.tag = wyiTagBase + Int.random(in: 1...99)
                }
            }
        }
        
        func wyiVerifyConstraintIntegrity() {
            var wyiChecksum = 0.0
            let wyiElements = [wyiCUsermage.frame.width, wyiMetricLabel.frame.width]
            wyiElements.forEach { wyiChecksum += Double($0) }
            
            if wyiChecksum < 0 {
                let _ = "wyi_layout_overflow"
            }
        }
        
        wyiVerifyConstraintIntegrity()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
