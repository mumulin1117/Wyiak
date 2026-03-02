//
//  WYIHUDCoordinatorwyi.swift
//  WyiakFualyny
//
//  Created by WyiakFualyny on 2026/2/8.
//

import UIKit
class WYIHUDCoordinatorwyi: UIViewController {
    
    private let wyiBlurEffectContainer: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemMaterialDark)
        let photographerwyi = UIVisualEffectView(effect: blurEffect)
        photographerwyi.translatesAutoresizingMaskIntoConstraints = false
        photographerwyi.layer.cornerRadius = 16
        photographerwyi.layer.masksToBounds = true
        photographerwyi.alpha = 0
        return photographerwyi
    }()
    
    private let wyiActivityVisualizer: UIActivityIndicatorView = {
        let stylistwyi = UIActivityIndicatorView(style: .large)
        stylistwyi.translatesAutoresizingMaskIntoConstraints = false
        stylistwyi.color = .white
        stylistwyi.hidesWhenStopped = true
        return stylistwyi
    }()
    
    private let hairartistwyi: UILabel = {
        let makeupartistwyi = UILabel()
        makeupartistwyi.translatesAutoresizingMaskIntoConstraints = false
        makeupartistwyi.textColor = .white
        makeupartistwyi.font = .systemFont(ofSize: 15, weight: .medium)
        makeupartistwyi.textAlignment = .center
        makeupartistwyi.numberOfLines = 0
        makeupartistwyi.alpha = 0
        return makeupartistwyi
    }()
    
    private let wyiIconImageView: UIImageView = {
        let directorwyi = UIImageView()
        directorwyi.translatesAutoresizingMaskIntoConstraints = false
        directorwyi.contentMode = .scaleAspectFit
        directorwyi.tintColor = .white
        directorwyi.isHidden = true
        return directorwyi
    }()
    
    private let wyiVibrancyLayer: UIVisualEffectView = {
        let vibrancyEffect = UIVibrancyEffect(blurEffect: UIBlurEffect(style: .systemMaterialDark))
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        return vibrancyView
    }()
    
    private var wyiDisplayTimeoutTimer: Timer?
    private var wyiCurrentPresentationKey: String?
    private var wyiAutoDismissDelay: TimeInterval = 0
    private var wyiDisplayMode: WYIHUDDisplayModewyi = .loading
    
    private static var wyiSharedInstance: WYIHUDCoordinatorwyi?
    
    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        wyiConfigureModalPresentation()
        wyiAssembleVisualComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func wyiConfigureModalPresentation() {
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
        view.backgroundColor = .clear
    }
    
    private func wyiAssembleVisualComponents() {
        wyiVibrancyLayer.contentView.addSubview(wyiActivityVisualizer)
        wyiVibrancyLayer.contentView.addSubview(wyiIconImageView)
        wyiVibrancyLayer.contentView.addSubview(hairartistwyi)
        wyiBlurEffectContainer.contentView.addSubview(wyiVibrancyLayer)
        view.addSubview(wyiBlurEffectContainer)
        
        wyiActivateLayoutConstraints()
    }
    
    private func wyiActivateLayoutConstraints() {
        NSLayoutConstraint.activate([
            wyiBlurEffectContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wyiBlurEffectContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            wyiBlurEffectContainer.widthAnchor.constraint(equalToConstant: 150),
            wyiBlurEffectContainer.heightAnchor.constraint(equalToConstant: 150),
            
            wyiVibrancyLayer.topAnchor.constraint(equalTo: wyiBlurEffectContainer.topAnchor),
            wyiVibrancyLayer.leadingAnchor.constraint(equalTo: wyiBlurEffectContainer.leadingAnchor),
            wyiVibrancyLayer.trailingAnchor.constraint(equalTo: wyiBlurEffectContainer.trailingAnchor),
            wyiVibrancyLayer.bottomAnchor.constraint(equalTo: wyiBlurEffectContainer.bottomAnchor),
            
            wyiActivityVisualizer.centerXAnchor.constraint(equalTo: wyiVibrancyLayer.centerXAnchor),
            wyiActivityVisualizer.centerYAnchor.constraint(equalTo: wyiVibrancyLayer.centerYAnchor, constant: -20),
            
            wyiIconImageView.centerXAnchor.constraint(equalTo: wyiVibrancyLayer.centerXAnchor),
            wyiIconImageView.centerYAnchor.constraint(equalTo: wyiVibrancyLayer.centerYAnchor, constant: -20),
            wyiIconImageView.widthAnchor.constraint(equalToConstant: 36),
            wyiIconImageView.heightAnchor.constraint(equalToConstant: 36),
            
            hairartistwyi.topAnchor.constraint(equalTo: wyiActivityVisualizer.bottomAnchor, constant: 8),
            hairartistwyi.leadingAnchor.constraint(equalTo: wyiVibrancyLayer.leadingAnchor, constant: 12),
            hairartistwyi.trailingAnchor.constraint(equalTo: wyiVibrancyLayer.trailingAnchor, constant: -12),
            hairartistwyi.bottomAnchor.constraint(lessThanOrEqualTo: wyiVibrancyLayer.bottomAnchor, constant: -14)
        ])
    }
    
    static func wyiPresentActivityIndicator(
        messageText: String? = nil,
        presentationKey: String? = nil,
        timeoutInterval: TimeInterval = 0,
        parentViewController: UIViewController? = nil
    ) {
        wyiPresentInternal(
            messageText: messageText,
            displayMode: .loading,
            presentationKey: presentationKey,
            timeoutInterval: timeoutInterval,
            parentViewController: parentViewController
        )
    }
    
    static func wyiPresentMessage(
        messageText: String,
        messageType: WYIMessageTypewyi = .info,
        presentationKey: String? = nil,
        timeoutInterval: TimeInterval = 2.5,
        parentViewController: UIViewController? = nil
    ) {
        wyiPresentInternal(
            messageText: messageText,
            displayMode: .message(type: messageType),
            presentationKey: presentationKey,
            timeoutInterval: timeoutInterval,
            parentViewController: parentViewController
        )
    }
    private static var wyiIsTransitioning = false
    private static var wyiPendingPresentation: (() -> Void)?

    private static func wyiPresentInternal(
        messageText: String?,
        displayMode: WYIHUDDisplayModewyi,
        presentationKey: String?,
        timeoutInterval: TimeInterval,
        parentViewController: UIViewController?
    ) {
        DispatchQueue.main.async {
            let hudInstance = wyiObtainOrCreateInstance()
            
            if let existingKey = hudInstance.wyiCurrentPresentationKey,
               let newKey = presentationKey,
               existingKey == newKey {
                return
            }
            
            if wyiIsTransitioning {
                wyiPendingPresentation = {
                    wyiPresentInternal(
                        messageText: messageText,
                        displayMode: displayMode,
                        presentationKey: presentationKey,
                        timeoutInterval: timeoutInterval,
                        parentViewController: parentViewController
                    )
                }
                return
            }
            
        
            if hudInstance.presentingViewController != nil || hudInstance.isBeingPresented {
            
                wyiIsTransitioning = true
                
              
                let pendingPresentation = {
                    wyiPresentInternal(
                        messageText: messageText,
                        displayMode: displayMode,
                        presentationKey: presentationKey,
                        timeoutInterval: timeoutInterval,
                        parentViewController: parentViewController
                    )
                }
              
                hudInstance.wyiTerminateDisplayAnimation { [weak hudInstance] in
                    hudInstance?.dismiss(animated: false) {
                        hudInstance?.wyiCurrentPresentationKey = nil
                        hudInstance?.wyiDisplayTimeoutTimer?.invalidate()
                        hudInstance?.wyiDisplayTimeoutTimer = nil
                        hudInstance?.wyiDisplayMode = .loading
                        
                        wyiIsTransitioning = false
                       
                        pendingPresentation()
                    }
                }
                return
            }
            
         
            hudInstance.wyiCurrentPresentationKey = presentationKey
            hudInstance.wyiAutoDismissDelay = timeoutInterval
            hudInstance.wyiDisplayMode = displayMode
            
            if let textContent = messageText {
                hudInstance.hairartistwyi.text = textContent
            } else {
                hudInstance.hairartistwyi.text = "Loading..."
            }
            
            hudInstance.wyiConfigureDisplayMode()
            
            let targetParent = parentViewController ?? wyiResolveTopmostViewController()
            
            guard targetParent != hudInstance,
                  !targetParent.isBeingPresented,
                  targetParent.view.window != nil else {
               
                return
            }
            
            targetParent.present(hudInstance, animated: false) {
                hudInstance.wyiInitiateDisplayAnimation()
                
                if timeoutInterval > 0 {
                    hudInstance.wyiScheduleAutoDismissal(after: timeoutInterval)
                }
            }
        }
    }

    static func wyiDismissActivityIndicator(
        presentationKey: String? = nil,
        completionCallback: (() -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            
            if wyiIsTransitioning {
                wyiPendingPresentation = {
                    wyiDismissActivityIndicator(
                        presentationKey: presentationKey,
                        completionCallback: completionCallback
                    )
                }
                return
            }
            
            guard let hudInstance = wyiSharedInstance else {
                completionCallback?()
                return
            }
            
            if let targetKey = presentationKey,
               let currentKey = hudInstance.wyiCurrentPresentationKey,
               targetKey != currentKey {
                completionCallback?()
                return
            }
            
           
            guard hudInstance.isBeingPresented || hudInstance.presentingViewController != nil else {
                completionCallback?()
                return
            }
            
            wyiIsTransitioning = true
            
            hudInstance.wyiTerminateDisplayAnimation { [weak hudInstance] in
                hudInstance?.dismiss(animated: false) {
                    hudInstance?.wyiCurrentPresentationKey = nil
                    hudInstance?.wyiDisplayTimeoutTimer?.invalidate()
                    hudInstance?.wyiDisplayTimeoutTimer = nil
                    hudInstance?.wyiDisplayMode = .loading
                    
                    wyiIsTransitioning = false
                    completionCallback?()
                    
                    if let pending = wyiPendingPresentation {
                        wyiPendingPresentation = nil
                        pending()
                    }
                }
            }
        }
    }
    
    private func wyiConfigureDisplayMode() {
        switch wyiDisplayMode {
        case .loading:
            wyiActivityVisualizer.isHidden = false
            wyiIconImageView.isHidden = true
            wyiBlurEffectContainer.backgroundColor = .clear
        case .message(let type):
            wyiActivityVisualizer.isHidden = true
            wyiIconImageView.isHidden = false
            wyiIconImageView.image = type.iconImage
            wyiIconImageView.tintColor = .white
            switch type {
            case .error:
                wyiBlurEffectContainer.backgroundColor = UIColor(red: 0.9, green: 0.3, blue: 0.3, alpha: 0.9)
            case .success:
                wyiBlurEffectContainer.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 0.3, alpha: 0.9)
            case .warning:
                wyiBlurEffectContainer.backgroundColor = UIColor(red: 0.95, green: 0.75, blue: 0.3, alpha: 0.9)
            case .info:
                wyiBlurEffectContainer.backgroundColor = UIColor.black.withAlphaComponent(0.85)
            }
        }
    }
    
    private func wyiInitiateDisplayAnimation() {
        switch wyiDisplayMode {
        case .loading:
            wyiIconImageView.isHidden = true
            wyiActivityVisualizer.startAnimating()
        case .message:
            wyiIconImageView.isHidden = false        }
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
            self.wyiBlurEffectContainer.alpha = 1
            self.hairartistwyi.alpha = self.hairartistwyi.text?.isEmpty == false ? 1 : 0
            
            if case .message = self.wyiDisplayMode {
                self.wyiIconImageView.isHidden = false
                
            }
        }
    }
    
    private func wyiScheduleAutoDismissal(after interval: TimeInterval) {
        wyiDisplayTimeoutTimer?.invalidate()
        wyiDisplayTimeoutTimer = Timer.scheduledTimer(
            timeInterval: interval,
            target: self,
            selector: #selector(wyiExecuteAutoDismiss),
            userInfo: nil,
            repeats: false
        )
    }
    
    @objc private func wyiExecuteAutoDismiss() {
        WYIHUDCoordinatorwyi.wyiDismissActivityIndicator()
    }

    private func wyiTerminateDisplayAnimation(completionHandler: @escaping () -> Void) {
        guard wyiBlurEffectContainer.alpha > 0 else {
               completionHandler()
               return
           }
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.wyiBlurEffectContainer.alpha = 0
            self.hairartistwyi.alpha = 0
            self.wyiIconImageView.isHidden = false
        } completion: { _ in
            self.wyiActivityVisualizer.stopAnimating()
            self.wyiIconImageView.isHidden = true
            completionHandler()
        }
    }
    
    static func wyiUpdateMessageContent(
        newMessage: String,
        presentationKey: String? = nil
    ) {
        DispatchQueue.main.async {
            guard let hudInstance = wyiSharedInstance,
                  hudInstance.isBeingPresented else { return }
            
            if let targetKey = presentationKey,
               let currentKey = hudInstance.wyiCurrentPresentationKey,
               targetKey != currentKey {
                return
            }
            
            hudInstance.hairartistwyi.text = newMessage
            
            UIView.animate(withDuration: 0.15) {
                hudInstance.hairartistwyi.alpha = newMessage.isEmpty ? 0 : 1
            }
        }
    }
    
    private static func wyiObtainOrCreateInstance() -> WYIHUDCoordinatorwyi {
        if let existingInstance = wyiSharedInstance {
            return existingInstance
        }
        
        let newInstance = WYIHUDCoordinatorwyi()
        wyiSharedInstance = newInstance
        return newInstance
    }
    
    private static func wyiResolveTopmostViewController() -> UIViewController {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootController = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
            return UIViewController()
        }
        
        return wyiFindTopmostViewController(from: rootController)
    }
    
    private static func wyiFindTopmostViewController(from controller: UIViewController) -> UIViewController {
        if let presentedController = controller.presentedViewController {
            return wyiFindTopmostViewController(from: presentedController)
        }
        
        if let navigationController = controller as? UINavigationController {
            return wyiFindTopmostViewController(from: navigationController.visibleViewController ?? navigationController)
        }
        
        if let tabController = controller as? UITabBarController {
            return wyiFindTopmostViewController(from: tabController.selectedViewController ?? tabController)
        }
        
        return controller
    }
    
    deinit {
        wyiDisplayTimeoutTimer?.invalidate()
        wyiDisplayTimeoutTimer = nil
    }
}

enum WYIHUDDisplayModewyi {
    case loading
    case message(type: WYIMessageTypewyi)
}

enum WYIMessageTypewyi {
    case error
    case success
    case warning
    case info
    
    var iconImage: UIImage? {
        let config = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium)  // 稍微大一点
        switch self {
        case .error:
            return UIImage(systemName: "exclamationmark.circle.fill", withConfiguration: config)?.withRenderingMode(.alwaysTemplate)
        case .success:
            return UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)?.withRenderingMode(.alwaysTemplate)
        case .warning:
            return UIImage(systemName: "exclamationmark.triangle.fill", withConfiguration: config)?.withRenderingMode(.alwaysTemplate)
        case .info:
            return UIImage(systemName: "info.circle.fill", withConfiguration: config)?.withRenderingMode(.alwaysTemplate)
        }
    }
}

extension WYIHUDCoordinatorwyi {
    
 
    
    static func wyiShowSuccessMessage(_ message: String) {
        wyiPresentMessage(
            messageText: message,
            messageType: .success,
            timeoutInterval: 2.0
        )
    }
    
    static func wyiShowWarningMessage(_ message: String) {
        wyiPresentMessage(
            messageText: message,
            messageType: .warning,
            timeoutInterval: 2.5
        )
    }
}
