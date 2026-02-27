import UIKit
class WyiakMainViewController: UITabBarController, UITabBarControllerDelegate {
    let wyiWorkshopButton = UIButton(type: .system)
    override func viewDidLoad() {
        super.viewDidLoad()
       
        wyiWorkshopButton.setTitle("Lumia Workshop", for: .normal)
        
        self.delegate = self
        
        
       
        wyiWorkshopButton.addTarget(self, action: #selector(wyiWorkshopButtonTapped), for: .touchUpInside)
       
        let collectionwyi = WyiakFluidTabBar()
        self.setValue(collectionwyi, forKey: "tabBar")
        
        searchwyi()
    }

    private func searchwyi() {
       
        let filterwyi = WYIExploreViewController()
        wyiWorkshopButton.setTitleColor(.white, for: .normal)
        wyiWorkshopButton.backgroundColor = UIColor.systemIndigo
        filterwyi.tabBarItem = UITabBarItem(title: nil, image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakicon")?.withRenderingMode(.alwaysOriginal),selectedImage: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakiconsel")?.withRenderingMode(.alwaysOriginal))
        wyiWorkshopButton.layer.cornerRadius = 10
       
        let profilewyi = WYIGridinteriorDesignwyi()
        wyiWorkshopButton.frame = CGRect(x: 20, y: 100, width: 150, height: 48)
         profilewyi.tabBarItem = UITabBarItem(title: nil, image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakicon1")?.withRenderingMode(.alwaysOriginal),selectedImage: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakiconsel1")?.withRenderingMode(.alwaysOriginal))
                                                                  
                                                                  
        let gallerywyi = WYInightPhotographywyi()
        gallerywyi.tabBarItem = UITabBarItem(title: nil, image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakicon2")?.withRenderingMode(.alwaysOriginal),selectedImage: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakiconsel2")?.withRenderingMode(.alwaysOriginal))
        wyiWorkshopButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        let albumwyi = WYIProfileNexusController()
        albumwyi.tabBarItem = UITabBarItem(title: nil, image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakicon3")?.withRenderingMode(.alwaysOriginal),selectedImage: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakiconsel3")?.withRenderingMode(.alwaysOriginal))
        
        viewControllers = [filterwyi, profilewyi, gallerywyi, albumwyi]
    
        if let customBar = self.tabBar as? WyiakFluidTabBar {
            customBar.currentSelectedIndex = 0
        }
    }
    @objc func wyiWorkshopButtonTapped() {
        let wyiWorkshopVC = WYILumiaWorkshoplerwyi()
        wyiWorkshopVC.modalPresentationStyle = .fullScreen
        wyiWorkshopVC.modalTransitionStyle = .crossDissolve
        present(wyiWorkshopVC, animated: true)
        
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let portfolio = self.tabBar as? WyiakFluidTabBar {
            portfolio.currentSelectedIndex = self.selectedIndex
        }
    }
    
    
}
