import UIKit
class WyiakMainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
   
        let customTabBar = WyiakFluidTabBar()
        self.setValue(customTabBar, forKey: "tabBar")
        
        setupViewControllers()
    }

    private func setupViewControllers() {
       
        let v1 = WYIExploreViewController()
       
        v1.tabBarItem = UITabBarItem(title: nil, image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakicon")?.withRenderingMode(.alwaysOriginal),selectedImage: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakiconsel")?.withRenderingMode(.alwaysOriginal))
        
        let v2 = WYIGridinteriorDesignwyi()
         v2.tabBarItem = UITabBarItem(title: nil, image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakicon1")?.withRenderingMode(.alwaysOriginal),selectedImage: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakiconsel1")?.withRenderingMode(.alwaysOriginal))
                                                                  
                                                                  
        let v3 = WYInightPhotographywyi()
        v3.tabBarItem = UITabBarItem(title: nil, image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakicon2")?.withRenderingMode(.alwaysOriginal),selectedImage: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakiconsel2")?.withRenderingMode(.alwaysOriginal))
        
        let v4 = WYIProfileNexusController()
        v4.tabBarItem = UITabBarItem(title: nil, image: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakicon3")?.withRenderingMode(.alwaysOriginal),selectedImage: WYICryptoProcessorwyi.wyiLoadEncryptedImage(imageIdentifier: "compassWyiakiconsel3")?.withRenderingMode(.alwaysOriginal))
        
        viewControllers = [v1, v2, v3, v4]
    
        if let customBar = self.tabBar as? WyiakFluidTabBar {
            customBar.currentSelectedIndex = 0
        }
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let customBar = self.tabBar as? WyiakFluidTabBar {
            customBar.currentSelectedIndex = self.selectedIndex
        }
    }
    
    
}
