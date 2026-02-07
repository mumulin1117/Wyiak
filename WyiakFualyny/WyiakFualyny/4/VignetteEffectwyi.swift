//
//  VignetteEffectwyi.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/7.
//

import UIKit

class WYIProfileNexusController: UIViewController {

    private let wyiViewWidth = UIScreen.main.bounds.width
    private let wyiViewHeight = UIScreen.main.bounds.height

    private let wyiEtherealScroll: UIScrollView = {
        let wyiScroll = UIScrollView()
        wyiScroll.backgroundColor = .clear
        wyiScroll.contentInsetAdjustmentBehavior = .never
        wyiScroll.showsVerticalScrollIndicator = false
        return wyiScroll
    }()

    private let wyiChromaHeader: UIImageView = {
        let wyiHeader = UIImageView.init(image: UIImage.init(named: "HeaderIJIyound"))
        wyiHeader.contentMode = .scaleToFill
        return wyiHeader
    }()

    private let wyiAvatarOrb: UIImageView = {
        let wyiImg = UIImageView()
        wyiImg.image = UIImage(named: "wyi_user_portrait")
        wyiImg.backgroundColor = .systemGray5
        wyiImg.contentMode = .scaleAspectFill
        wyiImg.layer.borderWidth = 4
        wyiImg.layer.borderColor = UIColor.white.cgColor
        wyiImg.clipsToBounds = true
        return wyiImg
    }()

    private let wyiIdentityLabel: UILabel = {
        let wyiName = UILabel()
        wyiName.text = "Bruno Pham"
        wyiName.font = UIFont.systemFont(ofSize: 24, weight: .black)
        wyiName.textColor = UIColor(white: 0.1, alpha: 1.0)
        wyiName.textAlignment = .center
        return wyiName
    }()

    private let wyiLocationTag: UILabel = {
        let wyiLoc = UILabel()
        wyiLoc.text = "Da Nang, Vietnam"
        wyiLoc.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        wyiLoc.textColor = .systemGray
        wyiLoc.textAlignment = .center
        return wyiLoc
    }()

    private let wyiSocialMetricsBar: UIView = {
        let wyiBar = UIView()
        wyiBar.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        wyiBar.layer.cornerRadius = 12
        return wyiBar
    }()

  
    private let wyiShortssBar: UIView = {
        let wyiBar = UIView()
        wyiBar.backgroundColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
       
        return wyiBar
    }()
    
    

    private let wyiEdistTrigger: UIButton = {
        let wyiBtn = UIButton(type: .custom)
        wyiBtn.setImage(UIImage(named: "wyiEdistTrigger"), for: .normal)
        
        return wyiBtn
    }()
    
    private let wyiSettingsTrigger: UIButton = {
        let wyiBtn = UIButton(type: .custom)
        wyiBtn.setImage(UIImage(named: "wyiSettingsTrigger"), for: .normal)
        
        return wyiBtn
    }()
    
    private let wyigiftsTrigger: UIButton = {
        let wyiBtn = UIButton(type: .custom)
        wyiBtn.setImage(UIImage(named: "wyigift"), for: .normal)
       
        return wyiBtn
    }()

    
    
    private lazy var wyishotsTrigger: UIButton = {
        let wyiBtn = UIButton(type: .custom)
     
        wyiBtn.isSelected = true
        wyiBtn.setTitle("0 shots", for: .normal)
        wyiBtn.setTitleColor(UIColor.white, for: .selected)
        wyiBtn.setTitleColor(UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1), for: .normal)
        wyiBtn.backgroundColor =   UIColor(red: 1, green: 0.26, blue: 0.73, alpha: 1)
        wyiBtn.addTarget(self, action: #selector(sureWYIShia(yuepoiu:)), for: .touchUpInside)
        wyiBtn.layer.cornerRadius = 5
        wyiBtn.layer.masksToBounds = true
        return wyiBtn
    }()
    
    private lazy var wyividoefrTrigger: UIButton = {
        let wyiBtn = UIButton(type: .custom)
        wyiBtn.addTarget(self, action: #selector(sureWYIShia(yuepoiu:)), for: .touchUpInside)
        wyiBtn.isSelected = true
        wyiBtn.setTitle("0 Videos", for: .normal)
        wyiBtn.setTitleColor(UIColor.white, for: .selected)
        wyiBtn.setTitleColor(UIColor(red: 0.74, green: 0.74, blue: 0.74, alpha: 1), for: .normal)
        wyiBtn.backgroundColor =   .white
        wyiBtn.layer.cornerRadius = 5
        wyiBtn.layer.masksToBounds = true
        return wyiBtn
    }()
    
   @objc func sureWYIShia(yuepoiu:UIButton) {
       wyishotsTrigger.isSelected = false
       wyividoefrTrigger.isSelected = false
       wyishotsTrigger.backgroundColor = .white
       wyividoefrTrigger.backgroundColor = .white
       yuepoiu.isSelected = true
       yuepoiu.backgroundColor =   UIColor(red: 1, green: 0.26, blue: 0.73, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imagebavk = UIImageView.init(frame: UIScreen.main.bounds)
        imagebavk.image = UIImage(named: "waynorambackh")
        imagebavk.contentMode = .scaleAspectFill
        self.view.addSubview(imagebavk)
        wyiSetupComponentTree()
        wyiApplyLayoutRatios()
    }
    private let wyinopsodtTag: UILabel = {
        let wyiLoc = UILabel()
        wyiLoc.text = "No post yet"
        wyiLoc.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        wyiLoc.textColor = .systemGray
        wyiLoc.textAlignment = .center
        return wyiLoc
    }()
    private func wyiSetupComponentTree() {
        view.addSubview(wyiEtherealScroll)
        view.addSubview(wyiSettingsTrigger)
        view.addSubview(wyigiftsTrigger)
       
        
        
        wyiEtherealScroll.addSubview(wyiChromaHeader)
        wyiEtherealScroll.addSubview(wyiAvatarOrb)
        wyiEtherealScroll.addSubview(wyiEdistTrigger)
        
        wyiEtherealScroll.addSubview(wyiIdentityLabel)
        
        
        wyiEtherealScroll.addSubview(wyiLocationTag)
        wyiEtherealScroll.addSubview(wyiSocialMetricsBar)
        
        wyiEtherealScroll.addSubview(wyiShortssBar)
      
        wyigiftsTrigger.addTarget(self, action: #selector(wyiLaunchEngineSettings), for: .touchUpInside)
        wyiSettingsTrigger.addTarget(self, action: #selector(wyiLaunchEngineSettings), for: .touchUpInside)
    }

    private func wyiApplyLayoutRatios() {
        wyiEtherealScroll.frame = view.bounds
        
        let wyiHeaderH = wyiViewHeight * 0.22
        wyiChromaHeader.frame = CGRect(x: 0, y: 0, width: wyiViewWidth, height: wyiHeaderH)
        
        let wyiOrbSize = wyiViewWidth * 0.32
        wyiAvatarOrb.frame = CGRect(x: (wyiViewWidth - wyiOrbSize)/2, y: wyiHeaderH - (wyiOrbSize/2), width: wyiOrbSize, height: wyiOrbSize)
        wyiAvatarOrb.layer.cornerRadius = wyiOrbSize / 2
        
        wyiIdentityLabel.frame = CGRect(x: 20, y: wyiAvatarOrb.frame.maxY + 15, width: wyiViewWidth - 40, height: 30)
        wyiLocationTag.frame = CGRect(x: 20, y: wyiIdentityLabel.frame.maxY + 5, width: wyiViewWidth - 40, height: 20)
        
        wyiSocialMetricsBar.frame = CGRect(x: 20, y: wyiLocationTag.frame.maxY + 25, width: wyiViewWidth - 40, height: 65)
        
        
        wyiShortssBar.frame = CGRect(x: 0, y: wyiSocialMetricsBar.frame.maxY + 25, width: wyiViewWidth , height: 51)
        
        wyishotsTrigger.frame = CGRect(x: 10, y: 6, width: (UIScreen.main.bounds.width - 20)/2, height: 39)
        
        wyividoefrTrigger.frame = CGRect(x: 10 + (UIScreen.main.bounds.width - 20)/2, y: 6, width: (UIScreen.main.bounds.width - 20)/2, height: 39)
        
        wyinopsodtTag.frame = CGRect(x: UIScreen.main.bounds.width/2 - 50, y: wyiShortssBar.frame.maxY + 40, width: 100, height: 30)
        wyiShortssBar.addSubview(wyishotsTrigger)
        wyiShortssBar.addSubview(wyividoefrTrigger)
        
        
        
        let wyiGridY = wyiSocialMetricsBar.frame.maxY + 30
        let wyiExpectedH = (wyiViewWidth/2) * 3
       
        wyiEtherealScroll.contentSize = CGSize(width: wyiViewWidth, height: wyiGridY + wyiExpectedH + 100)
        
        wyiEtherealScroll.addSubview(wyinopsodtTag)
        
        wyiSettingsTrigger.frame = CGRect(x: wyiViewWidth - 60, y: 50, width: 44, height: 44)
        wyigiftsTrigger.frame = CGRect(x:16, y: 50, width: 44, height: 44)
        wyiEdistTrigger.frame = CGRect(x:(UIScreen.main.bounds.width - 65)/2, y: wyiAvatarOrb.frame.maxY - 10, width: 65, height: 28)
        
        
        wyiPopulateMetricData()
    }

    private func wyiPopulateMetricData() {
        let wyiFollowerNode = wyiBuildMetricNode(wyiVal: "220", wyiKey: "Followers", wyiX: 0)
        let wyiFollowingNode = wyiBuildMetricNode(wyiVal: "150", wyiKey: "Following", wyiX: wyiSocialMetricsBar.frame.width / 2)
        wyiSocialMetricsBar.addSubview(wyiFollowerNode)
        wyiSocialMetricsBar.addSubview(wyiFollowingNode)
    }

    private func wyiBuildMetricNode(wyiVal: String, wyiKey: String, wyiX: CGFloat) -> UIView {
        let wyiContainer = UIView(frame: CGRect(x: wyiX, y: 0, width: wyiSocialMetricsBar.frame.width/2, height: 65))
        let wyiValLbl = UILabel(frame: CGRect(x: 0, y: 12, width: wyiContainer.frame.width, height: 22))
        wyiValLbl.text = wyiVal
        wyiValLbl.font = .systemFont(ofSize: 18, weight: .bold)
        wyiValLbl.textAlignment = .center
        
        let wyiKeyLbl = UILabel(frame: CGRect(x: 0, y: 34, width: wyiContainer.frame.width, height: 18))
        wyiKeyLbl.text = wyiKey
        wyiKeyLbl.font = .systemFont(ofSize: 13)
        wyiKeyLbl.textColor = .lightGray
        wyiKeyLbl.textAlignment = .center
        
        wyiContainer.addSubview(wyiValLbl)
        wyiContainer.addSubview(wyiKeyLbl)
        return wyiContainer
    }

    @objc private func wyiLaunchEngineSettings() {
        let wyiImpact = UIImpactFeedbackGenerator(style: .medium)
        wyiImpact.impactOccurred()
        
        let wyiAlert = UIAlertController(title: "Nexus System", message: "Preference module under synchronization.", preferredStyle: .actionSheet)
        wyiAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(wyiAlert, animated: true)
    }
}

