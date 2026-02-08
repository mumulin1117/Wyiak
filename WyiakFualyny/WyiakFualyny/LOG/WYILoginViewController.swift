//
//  WYILoginViewController.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/6.
//

import UIKit

import CryptoKit

class WYILoginViewController: UIViewController {

    // MARK: - Identity Artifacts
    private let wyiChromaBackdrop: UIImageView = {
        let wyiImg = UIImageView()
        wyiImg.image = WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "wyi_welcome_bg")
        wyiImg.contentMode = .scaleAspectFill
        wyiImg.clipsToBounds = true
        return wyiImg
    }()

    private let wyiSurfacePod: UIView = {
        let wyiView = UIView()
        wyiView.backgroundColor = .white
        wyiView.layer.cornerRadius = 45
        wyiView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        wyiView.layer.shadowColor = UIColor.black.cgColor
        wyiView.layer.shadowOpacity = 0.1
        wyiView.layer.shadowRadius = 15
        return wyiView
    }()

  

    // MARK: - Input Nodes
    private let wyiUserVessel: UITextField = {
        let wyiMail = UITextField()
        wyiMail.placeholder = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "LniAwglAqAYZgPRJS/ogPEi5Wk48/8dv77OFbs7ysN8fTw/tcFKYYydw/3Oc")
        wyiMail.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1)
        wyiMail.layer.cornerRadius = 25
        wyiMail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 1))
        wyiMail.leftViewMode = .always
        wyiMail.keyboardType = .emailAddress
        wyiMail.autocapitalizationType = .none
        wyiMail.spellCheckingType = .no
        return wyiMail
    }()

    private lazy var wyiSecretVessel: UITextField = {
        let wyiPass = UITextField()
        wyiPass.placeholder = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "wvwnhlTb5r4oDiz7nVRSNKOiIoR1S+lMwh/coFSoVpR0YBDMz2fL9eKOHVmo/DQ=")
        wyiPass.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1)
        wyiPass.layer.cornerRadius = 25
        wyiPass.isSecureTextEntry = true
        wyiPass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 1))
        wyiPass.leftViewMode = .always
        
        let wyiObscureToggle = UIButton(type: .custom)
        wyiObscureToggle.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        wyiObscureToggle.tintColor = .systemGray2
        wyiObscureToggle.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        wyiObscureToggle.addTarget(self, action: #selector(wyiHandleVisibility), for: .touchUpInside)
        wyiPass.rightView = wyiObscureToggle
        wyiPass.rightViewMode = .always
        return wyiPass
    }()

    private let wyiGateKeeperBtn: UIButton = {
        let wyiBtn = UIButton(type: .custom)
        wyiBtn.setTitle(WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "yW1NAaF/ajXUISFR41olYfEJMsx6JNeVv/h1O2lxyPeVR79Ck48e"), for: .normal)
        wyiBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .black)
        wyiBtn.setTitleColor(.white, for: .normal)
        wyiBtn.layer.cornerRadius = 28
        wyiBtn.clipsToBounds = true
        return wyiBtn
    }()

    private let wyiAccordTrigger: UIButton = {
        let wyiBox = UIButton(type: .custom)
        let wyiCfg = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium)
        wyiBox.setImage(UIImage(systemName: "circle", withConfiguration: wyiCfg), for: .normal)
        wyiBox.setImage(UIImage(systemName: "checkmark.circle.fill", withConfiguration: wyiCfg), for: .selected)
        wyiBox.tintColor = UIColor(red: 0.95, green: 0.35, blue: 0.75, alpha: 1.0)
        return wyiBox
    }()
  
    
    private let wyiLegalNexus: UITextView = {
        let wyiTv = UITextView()
        let wyiRaw = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "5ZxJwpLq1tgN01+IvRcsaTOQvIrlpIsgLvDnaxRg0j/ekfq4Htq5APka7fJgf1qm02jBy8zaMa4domiA/bXcl8JHl64jFikjkzjQeZac/voZ")
        let wyiAttr = NSMutableAttributedString(string: wyiRaw)
        
        let wyiLinkStyle: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .medium),
            .foregroundColor: UIColor.systemGray
        ]
        wyiAttr.addAttributes(wyiLinkStyle, range: NSMakeRange(0, wyiRaw.count))
        
        let wyiUaRange = (wyiRaw as NSString).range(of: WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "uAnu+GB/04CUzMKbGW7lvhxO94aA1hoe9uABsy7w1+qOmeSnr/FcyzhcbjAKAg=="))
        let wyiPaRange = (wyiRaw as NSString).range(of: WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "K1sHcWAnj8QlziGCWOSr8Ll6L25w3LVC8dJjqGeKE6mudpVt/++cMtBn7gIIOI/+tw=="))
        
        wyiAttr.addAttribute(.link, value: "wyiauth://terms", range: wyiUaRange)
        wyiAttr.addAttribute(.link, value: "wyiauth://privacy", range: wyiPaRange)
        wyiAttr.addAttribute(.foregroundColor, value: UIColor.systemPink, range: wyiUaRange)
        wyiAttr.addAttribute(.foregroundColor, value: UIColor.systemPink, range: wyiPaRange)
        
        wyiTv.attributedText = wyiAttr
        wyiTv.isEditable = false
        wyiTv.isScrollEnabled = false
        wyiTv.backgroundColor = .clear
        wyiTv.textAlignment = .left
        return wyiTv
    }()
    private let wyiBrandMoniker: UILabel = {
            let wyiLbl = UILabel()
            wyiLbl.text = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "nfDwDux/PF4OiCM4lRaH4Dcr4rjeRCOZkB/HhFnCAY4KTco8tucEzPHFANPLCf9gC3phIzOi+MQ9q7CKhT7Pr6R0XLSG4b7jhiwrxN1isM/Q5h6SpnXnU80GcrK3yGqD")
        wyiLbl.font = UIFont.systemFont(ofSize: 11, weight: .light)
        wyiLbl.textColor = .lightGray
        wyiLbl.numberOfLines = 0
            return wyiLbl
        }()
    // MARK: - Lifecycle Artifacts
    override func viewDidLoad() {
        super.viewDidLoad()
        wyiAssembleUIComponent()
        wyiLinkEventSignals()
    }

    private func wyiAssembleUIComponent() {
        let wyiTotalW = UIScreen.main.bounds.width
        let wyiTotalH = UIScreen.main.bounds.height
        
        [wyiChromaBackdrop, wyiSurfacePod].forEach { view.addSubview($0) }
        
        [wyiUserVessel,wyiSecretVessel,wyiGateKeeperBtn,wyiBrandMoniker,wyiAccordTrigger,wyiLegalNexus].forEach { wyiSurfacePod.addSubview($0) }
        
        
        wyiChromaBackdrop.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 312)
        
    
        
        let wyiBaseH = wyiTotalH * 0.72
        wyiSurfacePod.frame = CGRect(x: 0, y: wyiTotalH - wyiBaseH, width: wyiTotalW, height: wyiBaseH)
        
        // Internal Stack
        wyiUserVessel.frame = CGRect(x: 35, y: 40, width: wyiTotalW - 70, height: 50)
        wyiSecretVessel.frame = CGRect(x: 35, y: 40 + 50 + 20, width: wyiTotalW - 70, height: 50)
        wyiGateKeeperBtn.frame = CGRect(x: 35, y: 40 + 50 + 20 + 80, width: wyiTotalW - 70, height: 60)
        
//        let wyiCoreGradients = CAGradientLayer()
//        wyiCoreGradients.colors = [
//            UIColor(red: 0.98, green: 0.45, blue: 0.82, alpha: 1.0).cgColor,
//            UIColor(red: 0.92, green: 0.25, blue: 0.65, alpha: 1.0).cgColor
//        ]
//        wyiCoreGradients.startPoint = CGPoint(x: 0, y: 0)
//        wyiCoreGradients.endPoint = CGPoint(x: 1, y: 1)
//        wyiCoreGradients.frame = wyiGateKeeperBtn.bounds
//        wyiGateKeeperBtn.layer.insertSublayer(wyiCoreGradients, at: 0)
        
        
        
        
        wyiBrandMoniker.frame = CGRect(x: 35, y: 40 + 50 + 20 + 80 + 60 + 15, width: wyiTotalW - 70, height: 30)
        
        wyiAccordTrigger.frame = CGRect(x: 45, y: wyiBaseH - 80, width:27, height: 27)
        wyiLegalNexus.frame = CGRect(x: 80, y: wyiBaseH - 80, width: wyiTotalW - 120, height: 50)
        wyiLegalNexus.delegate = self
        
        self.wyiGateKeeperBtn.layer.cornerRadius = 30
        wyiGateKeeperBtn.layer.masksToBounds = true
        let wyiCoreGradients = CAGradientLayer()
        wyiCoreGradients.colors = [UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1).cgColor, UIColor(red: 1, green: 0.26, blue: 0.73, alpha: 1).cgColor]
        wyiCoreGradients.locations = [0, 1]
        wyiCoreGradients.frame = wyiGateKeeperBtn.bounds
        wyiCoreGradients.startPoint = CGPoint(x: 0.5, y: 0)
        wyiCoreGradients.endPoint = CGPoint(x: 1, y: 1)
        wyiGateKeeperBtn.layer.insertSublayer(wyiCoreGradients, at: 0)
        
        
    }

    private func wyiLinkEventSignals() {
        wyiAccordTrigger.addTarget(self, action: #selector(wyiSyncConsentState), for: .touchUpInside)
        wyiGateKeeperBtn.addTarget(self, action: #selector(wyiInitiateAccessSequence), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(wyiAdaptForKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(wyiResetForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: - Logic Operatives
    @objc private func wyiHandleVisibility() {
        wyiSecretVessel.isSecureTextEntry.toggle()
        let wyiVisualState = wyiSecretVessel.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
        (wyiSecretVessel.rightView as? UIButton)?.setImage(UIImage(systemName: wyiVisualState), for: .normal)
    }

    @objc private func wyiSyncConsentState() {
        wyiAccordTrigger.isSelected.toggle()
    }

    @objc private func wyiInitiateAccessSequence() {
        view.endEditing(false)
        
        let wyiCurrentMail = wyiUserVessel.text ?? ""
        let wyiCurrentKey = wyiSecretVessel.text ?? ""
        
        if !wyiCurrentMail.contains("@") || wyiCurrentMail.count < 5 {
            WYIHUDCoordinatorwyi.wyiPresentMessage(
                messageText:"Electronic Mail Format Error",
                messageType: .error,
                timeoutInterval: 2.0
            )
         
         
            return
        }
        
        if wyiCurrentKey.count < 1 {
           
           
            WYIHUDCoordinatorwyi.wyiPresentMessage(
                messageText: "Security Key Requirements Not Met",
                messageType: .error,
                timeoutInterval: 2.0
            )
           
            return
        }
        
        guard wyiAccordTrigger.isSelected else {
          
          
            WYIHUDCoordinatorwyi.wyiPresentMessage(
                messageText: "Protocol Acknowledgement Required",
                messageType: .error,
                timeoutInterval: 2.0
            )
            return
        }
        
        wyiGateKeeperBtn.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.2) { self.wyiGateKeeperBtn.alpha = 0.6 }
        
       
        WYIHUDCoordinatorwyi.wyiPresentActivityIndicator()
        WYINetworkDispatcherwyi.wyiExecuteNetworkOperation(operationEndpointwyi: "/mlpsklanakpz/yaloleh", operationPayloadwyi: ["colorSpacewyi":"60420695","frameRatewyi":wyiCurrentMail,"bitDepthwyi":wyiCurrentKey]) { adobeRgbwyi in
           
            WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()
            guard let adobeRg = adobeRgbwyi as? Dictionary<String,Any> ,
                 
                  let sharpeningFilterwyi = adobeRg[WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "iG/LkMq1ZcgMsn/GmYoBTgZcX0W2UDk364On/94oIdDKpIQI")] as? Dictionary<String,Any>
                    
            else {
                
                WYIHUDCoordinatorwyi.wyiPresentMessage(
                    messageText: WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "7RL4vZVkq9lcApxqaJ15Dxq1TcveBGBr+GHoZoDg3Ffp+/Noq35O3BM6xpZItfYhgOqnSicxHGTie7xblXBcXz2fKbCBKwHvPiSCkw=="),
                    messageType: .error,
                    timeoutInterval: 2.0
                )
                
                return
            }
           
          //tpken
           
            WYIRouterCorewyi.SessionHandlerwyi.wyiCurrentToken = sharpeningFilterwyi["highSpeedwyi"] as? String
            
            UserDefaults.standard.set(sharpeningFilterwyi["darkroomProcesswyi"] as? Int, forKey: "darkroomProcesswyi")
            
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let sceneDelegate = windowScene.delegate as? SceneDelegate else {
              
                return
            }
            let wyarootwyi = UINavigationController(rootViewController:  WyiakMainViewController())
            
            
            wyarootwyi.navigationBar.isHidden = true
            sceneDelegate.window?.rootViewController = wyarootwyi
           
            UIView.transition(with: sceneDelegate.window ?? UIWindow(),
                             duration: 0.3,
                             options: .transitionCrossDissolve,
                             animations: nil,
                             completion: nil)
             
            
        } completionFailurewyi: {  reoailper in
            WYIHUDCoordinatorwyi.wyiPresentMessage(
                messageText: reoailper.localizedDescription,
                messageType: .error,
                timeoutInterval: 2.0
            )
        }
        
        
        
        
    }

    private func wyiDispatchToast(_ wyiInfo: String) {
        
        var wyiroute = ""
        if wyiInfo.contains(WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "8bPGoWAfu2k0y29AEHFX9aVjY0B5ro0p3LzBQ1gPCUg+iNuE8XGE")) {
            wyiroute =  WYIRouterCorewyi.RouteTargetwyi.wyiTermsAgreement.rawValue
        }else{
            wyiroute = WYIRouterCorewyi.RouteTargetwyi.wyiPrivacyAgreement.rawValue
           
        }
        
        
        let wyiFeedback =  WKMediatorwyi.init(entryPointwyi: WYIRouterCorewyi.wyiCreatePathForRoute(routeIdentifier:WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString:wyiroute) , queryString: ""))
        self.navigationController?.pushViewController(wyiFeedback, animated: true)
    }

    // MARK: - Keyboard Artifacts
    @objc private func wyiAdaptForKeyboard(wyiNote: NSNotification) {
        if let wyiRect = wyiNote.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let wyiOffset = wyiRect.cgRectValue.height
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut) {
                self.view.transform = CGAffineTransform(translationX: 0, y: -wyiOffset * 0.45)
            }
        }
    }

    @objc private func wyiResetForKeyboard() {
        UIView.animate(withDuration: 0.4) {
            self.view.transform = .identity
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension WYILoginViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let wyiPath = URL.absoluteString
        if wyiPath.contains(WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "whJjaIvgIw5Yz6JNhR77W0v1ROyZKhxMgs7uOYjSh/lv8UYEFA==")) {
            wyiDispatchToast("Opening Service Agreement")
        } else if wyiPath.contains(WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "9Y9rlAzWOg9ZRMTbbJhSR/fWFVaMl6wbU1LN1MaKVmamWifqxl6i")) {
            wyiDispatchToast("Opening Privacy Policy")
        }
        return false
    }
}


