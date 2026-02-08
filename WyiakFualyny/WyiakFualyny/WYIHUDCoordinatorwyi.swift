//
//  WYIHUDCoordinatorwyi.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/8.
//

import UIKit
class WYIHUDCoordinatorwyi: UIViewController {
    
    private let wyiBlurEffectContainer: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemMaterialDark)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.layer.cornerRadius = 16
        effectView.layer.masksToBounds = true
        effectView.alpha = 0
        return effectView
    }()
    
    private let wyiActivityVisualizer: UIActivityIndicatorView = {
        let visualizer = UIActivityIndicatorView(style: .large)
        visualizer.translatesAutoresizingMaskIntoConstraints = false
        visualizer.color = .white
        visualizer.hidesWhenStopped = true
        return visualizer
    }()
    
    private let wyiMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    private let wyiIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.isHidden = true
        return imageView
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
        wyiVibrancyLayer.contentView.addSubview(wyiMessageLabel)
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
            
            wyiMessageLabel.topAnchor.constraint(equalTo: wyiActivityVisualizer.bottomAnchor, constant: 16),
            wyiMessageLabel.leadingAnchor.constraint(equalTo: wyiVibrancyLayer.leadingAnchor, constant: 12),
            wyiMessageLabel.trailingAnchor.constraint(equalTo: wyiVibrancyLayer.trailingAnchor, constant: -12),
            wyiMessageLabel.bottomAnchor.constraint(lessThanOrEqualTo: wyiVibrancyLayer.bottomAnchor, constant: -20)
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
            
            hudInstance.wyiCurrentPresentationKey = presentationKey
            hudInstance.wyiAutoDismissDelay = timeoutInterval
            hudInstance.wyiDisplayMode = displayMode
            
            if let textContent = messageText {
                hudInstance.wyiMessageLabel.text = textContent
            } else {
                hudInstance.wyiMessageLabel.text = "Processing your request..."
            }
            
            hudInstance.wyiConfigureDisplayMode()
            
            let targetParent = parentViewController ?? wyiResolveTopmostViewController()
            
            guard !targetParent.isBeingPresented && !hudInstance.isBeingPresented else { return }
            
            targetParent.present(hudInstance, animated: false) {
                hudInstance.wyiInitiateDisplayAnimation()
            }
            
            if timeoutInterval > 0 {
                hudInstance.wyiScheduleAutoDismissal(after: timeoutInterval)
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
            wyiActivityVisualizer.startAnimating()
        case .message:
         
            break
        }
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
            self.wyiBlurEffectContainer.alpha = 1
            self.wyiMessageLabel.alpha = self.wyiMessageLabel.text?.isEmpty == false ? 1 : 0
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
    
    static func wyiDismissActivityIndicator(
        presentationKey: String? = nil,
        completionCallback: (() -> Void)? = nil
    ) {
        DispatchQueue.main.async {
            guard let hudInstance = wyiSharedInstance,
                  hudInstance.isBeingPresented || hudInstance.presentingViewController != nil else {
                completionCallback?()
                return
            }
            
            if let targetKey = presentationKey,
               let currentKey = hudInstance.wyiCurrentPresentationKey,
               targetKey != currentKey {
                completionCallback?()
                return
            }
            
            hudInstance.wyiTerminateDisplayAnimation {
                hudInstance.dismiss(animated: false) {
                    hudInstance.wyiCurrentPresentationKey = nil
                    hudInstance.wyiDisplayTimeoutTimer?.invalidate()
                    hudInstance.wyiDisplayTimeoutTimer = nil
                    hudInstance.wyiDisplayMode = .loading
                    completionCallback?()
                }
            }
        }
    }
    
    private func wyiTerminateDisplayAnimation(completionHandler: @escaping () -> Void) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.wyiBlurEffectContainer.alpha = 0
            self.wyiMessageLabel.alpha = 0
            self.wyiIconImageView.alpha = 0
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
            
            hudInstance.wyiMessageLabel.text = newMessage
            
            UIView.animate(withDuration: 0.15) {
                hudInstance.wyiMessageLabel.alpha = newMessage.isEmpty ? 0 : 1
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
        let config = UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)
        switch self {
        case .error:
            return UIImage(systemName: "exclamationmark.circle.fill", withConfiguration: config)
        case .success:
            return UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        case .warning:
            return UIImage(systemName: "exclamationmark.triangle.fill", withConfiguration: config)
        case .info:
            return UIImage(systemName: "info.circle.fill", withConfiguration: config)
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
